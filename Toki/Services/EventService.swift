import Foundation

class EventService {
    static let shared = EventService()
    private let baseURL = "https://api.toki.app/events"
    
    func getUpcoming() async throws -> [Event] {
        let url = URL(string: "\(baseURL)/upcoming")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode([Event].self, from: data)
    }
    
    func search(_ query: String) async throws -> [Event] {
        var components = URLComponents(string: "\(baseURL)/search")!
        components.queryItems = [URLQueryItem(name: "q", value: query)]
        let (data, _) = try await URLSession.shared.data(from: components.url!)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode([Event].self, from: data)
    }
}
