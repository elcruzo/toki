import Foundation

class SearchHistory: ObservableObject {
    @Published var queries: [String] = []
    private let key = "searchHistory"
    private let maxItems = 20
    
    init() {
        load()
    }
    
    func add(_ query: String) {
        queries.removeAll { $0 == query }
        queries.insert(query, at: 0)
        if queries.count > maxItems {
            queries = Array(queries.prefix(maxItems))
        }
        save()
    }
    
    func clear() {
        queries = []
        save()
    }
    
    private func load() {
        queries = UserDefaults.standard.stringArray(forKey: key) ?? []
    }
    
    private func save() {
        UserDefaults.standard.set(queries, forKey: key)
    }
}
