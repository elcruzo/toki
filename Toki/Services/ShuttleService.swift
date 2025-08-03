import Foundation
import CoreLocation

class ShuttleService {
    static let shared = ShuttleService()
    private let baseURL = "https://api.toki.app/shuttle"
    
    func getRoutes() async throws -> [ShuttleRoute] {
        let url = URL(string: "\(baseURL)/routes")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([ShuttleRoute].self, from: data)
    }
    
    func getArrivals(stopId: String) async throws -> [ShuttleArrival] {
        let url = URL(string: "\(baseURL)/stops/\(stopId)/arrivals")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([ShuttleArrival].self, from: data)
    }
}

struct ShuttleRoute: Identifiable, Codable {
    let id: String
    let name: String
    let color: String
    let stops: [ShuttleStop]
}

struct ShuttleStop: Identifiable, Codable {
    let id: String
    let name: String
    let latitude: Double
    let longitude: Double
}

struct ShuttleArrival: Identifiable, Codable {
    let id: String
    let routeName: String
    let minutesAway: Int
}
