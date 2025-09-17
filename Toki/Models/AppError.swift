import Foundation

enum AppError: LocalizedError {
    case network
    case unauthorized
    case notFound
    case serverError
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .network: return "check your connection"
        case .unauthorized: return "please sign in again"
        case .notFound: return "not found"
        case .serverError: return "something went wrong"
        case .unknown: return "unknown error"
        }
    }
    
    static func from(_ statusCode: Int) -> AppError {
        switch statusCode {
        case 401: return .unauthorized
        case 404: return .notFound
        case 500...599: return .serverError
        default: return .unknown
        }
    }
}
