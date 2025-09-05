import Foundation

class AnalyticsService {
    static let shared = AnalyticsService()
    private let baseURL = "https://api.toki.app/analytics"
    
    func track(_ event: String, properties: [String: Any] = [:]) {
        Task {
            var body: [String: Any] = [
                "event": event,
                "timestamp": ISO8601DateFormatter().string(from: Date())
            ]
            body.merge(properties) { _, new in new }
            
            guard let url = URL(string: "\(baseURL)/track"),
                  let data = try? JSONSerialization.data(withJSONObject: body) else { return }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
            
            _ = try? await URLSession.shared.data(for: request)
        }
    }
    
    func trackQuery(_ query: String) {
        track("query", properties: ["query": query])
    }
    
    func trackScreen(_ screen: String) {
        track("screen_view", properties: ["screen": screen])
    }
}
