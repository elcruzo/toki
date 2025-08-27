import Foundation

struct TokiAlert: Identifiable, Codable {
    let id: String
    let type: AlertType
    let condition: String
    let isActive: Bool
    let createdAt: Date
}

enum AlertType: String, Codable {
    case classOpen = "class_open"
    case libraryQuiet = "library_quiet"
    case diningOpen = "dining_open"
    case shuttleArriving = "shuttle_arriving"
}
