import Foundation
import Combine

// MARK: - Auth Service

@MainActor
final class AuthService: ObservableObject {
    static let shared = AuthService()
    
    @Published private(set) var isAuthenticated = false
    @Published private(set) var currentUser: User?
    @Published private(set) var isLoading = false
    @Published private(set) var error: AuthError?
    
    private let baseURL = "https://api.gettoki.app/auth"
    private let session: URLSession
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder
    
    private init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        self.session = URLSession(configuration: config)
        
        self.decoder = JSONDecoder()
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        self.encoder = JSONEncoder()
        self.encoder.keyEncodingStrategy = .convertToSnakeCase
        
        // Check for existing session
        checkExistingSession()
    }
    
    // MARK: - Public Methods
    
    func signIn(email: String, password: String) async {
        guard !email.isEmpty, !password.isEmpty else {
            error = .invalidCredentials
            return
        }
        
        isLoading = true
        error = nil
        
        do {
            let response = try await performSignIn(email: email, password: password)
            
            currentUser = response.user
            isAuthenticated = true
            
            // Store token securely
            storeToken(response.token)
            
        } catch let authError as AuthError {
            error = authError
        } catch {
            self.error = .networkError
        }
        
        isLoading = false
    }
    
    func signOut() {
        currentUser = nil
        isAuthenticated = false
        clearToken()
    }
    
    func refreshSession() async {
        guard let token = getStoredToken() else {
            signOut()
            return
        }
        
        do {
            let response = try await performRefresh(token: token)
            currentUser = response.user
            isAuthenticated = true
            storeToken(response.token)
        } catch {
            signOut()
        }
    }
    
    // MARK: - Private Methods
    
    private func checkExistingSession() {
        if let token = getStoredToken(), !token.isEmpty {
            Task {
                await refreshSession()
            }
        }
    }
    
    private func performSignIn(email: String, password: String) async throws -> AuthResponse {
        guard let url = URL(string: "\(baseURL)/signin") else {
            throw AuthError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = SignInRequest(email: email, password: password)
        request.httpBody = try encoder.encode(body)
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw AuthError.networkError
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            return try decoder.decode(AuthResponse.self, from: data)
        case 401:
            throw AuthError.invalidCredentials
        case 404:
            throw AuthError.userNotFound
        default:
            throw AuthError.serverError
        }
    }
    
    private func performRefresh(token: String) async throws -> AuthResponse {
        guard let url = URL(string: "\(baseURL)/refresh") else {
            throw AuthError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw AuthError.sessionExpired
        }
        
        return try decoder.decode(AuthResponse.self, from: data)
    }
    
    // MARK: - Token Storage
    
    private func storeToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: "authToken")
    }
    
    private func getStoredToken() -> String? {
        UserDefaults.standard.string(forKey: "authToken")
    }
    
    private func clearToken() {
        UserDefaults.standard.removeObject(forKey: "authToken")
    }
}

// MARK: - Request/Response Types

private struct SignInRequest: Encodable {
    let email: String
    let password: String
}

struct AuthResponse: Decodable {
    let token: String
    let user: User
}

struct User: Codable, Identifiable, Equatable {
    let id: String
    let email: String
    let name: String
    let university: String
}

// MARK: - Auth Errors

enum AuthError: LocalizedError {
    case invalidURL
    case invalidCredentials
    case userNotFound
    case sessionExpired
    case networkError
    case serverError
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidCredentials:
            return "Invalid email or password"
        case .userNotFound:
            return "User not found"
        case .sessionExpired:
            return "Session expired. Please sign in again."
        case .networkError:
            return "Network error. Please check your connection."
        case .serverError:
            return "Server error. Please try again later."
        }
    }
}
