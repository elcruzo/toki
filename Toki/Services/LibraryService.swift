import Foundation

class LibraryService {
    static let shared = LibraryService()
    private let baseURL = "https://api.toki.app/library"
    
    func getOccupancy() async throws -> LibraryOccupancy {
        let url = URL(string: "\(baseURL)/occupancy")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(LibraryOccupancy.self, from: data)
    }
    
    func getStudyRooms() async throws -> [StudyRoom] {
        let url = URL(string: "\(baseURL)/rooms")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([StudyRoom].self, from: data)
    }
}

struct LibraryOccupancy: Codable {
    let current: Int
    let capacity: Int
    let trend: String
}

struct StudyRoom: Identifiable, Codable {
    let id: String
    let name: String
    let floor: Int
    let capacity: Int
    let isAvailable: Bool
}
