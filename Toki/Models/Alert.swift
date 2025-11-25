import Foundation

// MARK: - Alert

struct TokiAlert: Identifiable, Codable, Equatable {
    let id: String
    let type: AlertType
    let condition: String
    var isActive: Bool
    let createdAt: Date
    
    var displayDescription: String {
        switch type {
        case .classOpen:
            return "Notify when \(condition) opens"
        case .libraryQuiet:
            return "Notify when library is below \(condition)% capacity"
        case .diningOpen:
            return "Notify when \(condition) opens"
        case .shuttleArriving:
            return "Notify when shuttle arrives at \(condition)"
        }
    }
}

// MARK: - Alert Type

enum AlertType: String, Codable, CaseIterable {
    case classOpen = "class_open"
    case libraryQuiet = "library_quiet"
    case diningOpen = "dining_open"
    case shuttleArriving = "shuttle_arriving"
    
    var displayName: String {
        switch self {
        case .classOpen: return "Class Opens"
        case .libraryQuiet: return "Library Quiet"
        case .diningOpen: return "Dining Opens"
        case .shuttleArriving: return "Shuttle Arriving"
        }
    }
    
    var icon: String {
        switch self {
        case .classOpen: return "book"
        case .libraryQuiet: return "books.vertical"
        case .diningOpen: return "fork.knife"
        case .shuttleArriving: return "bus"
        }
    }
    
    var placeholder: String {
        switch self {
        case .classOpen: return "e.g., BIO 101"
        case .libraryQuiet: return "e.g., 50"
        case .diningOpen: return "e.g., Main Cafe"
        case .shuttleArriving: return "e.g., Student Center"
        }
    }
}
