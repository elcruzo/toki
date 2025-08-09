import Foundation

class AuthService: ObservableObject {
    static let shared = AuthService()
    
    @Published var isAuthenticated = false
    @Published var currentUser: User?
    
    private let baseURL = "https://api.toki.app/auth"
    
    func signIn(email: String, password: String) async throws {
        let url = URL(string: "\(baseURL)/signin")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = ["email": email, "password": password]
        request.httpBody = try JSONEncoder().encode(body)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(AuthResponse.self, from: data)
        
        await MainActor.run {
            self.currentUser = response.user
            self.isAuthenticated = true
        }
        
        UserDefaults.standard.set(response.token, forKey: "authToken")
    }
    
    func signOut() {
        currentUser = nil
        isAuthenticated = false
        UserDefaults.standard.removeObject(forKey: "authToken")
    }
}

struct AuthResponse: Codable {
    let token: String
    let user: User
}

struct User: Codable {
    let id: String
    let email: String
    let name: String
    let university: String
}
