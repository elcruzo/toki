import Foundation

// MARK: - Deep Link Handler

enum DeepLink: Equatable {
    case chat(query: String?)
    case explore
    case alerts
    case settings
    
    // MARK: - Initialization
    
    init?(url: URL) {
        guard url.scheme == "toki" else { return nil }
        
        switch url.host {
        case "chat":
            let query = URLComponents(url: url, resolvingAgainstBaseURL: false)?
                .queryItems?
                .first(where: { $0.name == "q" })?
                .value
            self = .chat(query: query)
            
        case "explore":
            self = .explore
            
        case "alerts":
            self = .alerts
            
        case "settings":
            self = .settings
            
        default:
            return nil
        }
    }
    
    // MARK: - Tab Index
    
    var tabIndex: Int {
        switch self {
        case .chat: return 0
        case .explore: return 1
        case .alerts: return 2
        case .settings: return 3
        }
    }
}
