import Foundation

struct Event: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let location: String
    let startTime: Date
    let endTime: Date
    let category: String
    let isFree: Bool
}
