import Foundation

enum DeepLink {
    case chat(query: String?)
    case dining
    case library
    case shuttle
    case events
    
    init?(url: URL) {
        guard url.scheme == "toki" else { return nil }
        
        switch url.host {
        case "chat":
            let query = URLComponents(url: url, resolvingAgainstBaseURL: false)?
                .queryItems?.first(where: { $0.name == "q" })?.value
            self = .chat(query: query)
        case "dining": self = .dining
        case "library": self = .library
        case "shuttle": self = .shuttle
        case "events": self = .events
        default: return nil
        }
    }
}
