import Foundation

struct Campus: Identifiable, Codable {
    let id: String
    let name: String
    let shortName: String
    let location: String
    let studentCount: Int
}

struct DiningHall: Identifiable, Codable {
    let id: String
    let name: String
    let isOpen: Bool
    let currentWait: Int?
    let menu: [MenuItem]
}

struct MenuItem: Identifiable, Codable {
    let id: String
    let name: String
    let station: String
}
// campus-specific logic
