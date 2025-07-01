import Foundation

class APIService {
    static let shared = APIService()
    private let baseURL = "https://api.toki.app"
    
    func ask(_ query: String) async throws -> String {
        let url = URL(string: "\(baseURL)/ask")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = ["query": query]
        request.httpBody = try JSONEncoder().encode(body)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(AskResponse.self, from: data)
        return response.answer
    }
}

struct AskResponse: Codable {
    let answer: String
}
