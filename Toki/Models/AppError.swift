import Foundation

// MARK: - App Error

enum AppError: LocalizedError, Equatable {
    case network
    case unauthorized
    case notFound
    case serverError
    case timeout
    case unknown(String)
    
    var errorDescription: String? {
        switch self {
        case .network:
            return "Unable to connect. Please check your internet connection."
        case .unauthorized:
            return "Your session has expired. Please sign in again."
        case .notFound:
            return "The requested resource was not found."
        case .serverError:
            return "Something went wrong on our end. Please try again later."
        case .timeout:
            return "The request timed out. Please try again."
        case .unknown(let message):
            return message
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .network:
            return "Check your Wi-Fi or cellular connection and try again."
        case .unauthorized:
            return "Tap to sign in."
        case .notFound:
            return nil
        case .serverError:
            return "If the problem persists, contact support."
        case .timeout:
            return "The server may be busy. Try again in a moment."
        case .unknown:
            return nil
        }
    }
    
    var icon: String {
        switch self {
        case .network: return "wifi.slash"
        case .unauthorized: return "person.crop.circle.badge.exclamationmark"
        case .notFound: return "magnifyingglass"
        case .serverError: return "exclamationmark.triangle"
        case .timeout: return "clock.badge.exclamationmark"
        case .unknown: return "questionmark.circle"
        }
    }
    
    // MARK: - Factory Methods
    
    static func from(statusCode: Int) -> AppError {
        switch statusCode {
        case 401: return .unauthorized
        case 404: return .notFound
        case 408: return .timeout
        case 500...599: return .serverError
        default: return .unknown("HTTP error \(statusCode)")
        }
    }
    
    static func from(_ error: Error) -> AppError {
        if let appError = error as? AppError {
            return appError
        }
        
        let nsError = error as NSError
        
        switch nsError.code {
        case NSURLErrorNotConnectedToInternet,
             NSURLErrorNetworkConnectionLost:
            return .network
        case NSURLErrorTimedOut:
            return .timeout
        default:
            return .unknown(error.localizedDescription)
        }
    }
}
