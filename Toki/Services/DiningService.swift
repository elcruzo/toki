import Foundation

class DiningService {
    static let shared = DiningService()
    private let baseURL = "https://api.toki.app/dining"
    
    func getHalls() async throws -> [DiningHall] {
        let url = URL(string: "\(baseURL)/halls")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([DiningHall].self, from: data)
    }
    
    func getMenu(hallId: String) async throws -> [MenuItem] {
        let url = URL(string: "\(baseURL)/halls/\(hallId)/menu")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([MenuItem].self, from: data)
    }
}
