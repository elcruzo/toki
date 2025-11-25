import Foundation

// MARK: - Search History

@MainActor
final class SearchHistory: ObservableObject {
    @Published private(set) var queries: [String] = []
    
    private let storageKey = "searchHistory"
    private let maxItems = 20
    
    init() {
        load()
    }
    
    // MARK: - Public Methods
    
    func add(_ query: String) {
        let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        
        // Remove if already exists (to move to top)
        queries.removeAll { $0.lowercased() == trimmed.lowercased() }
        
        // Insert at beginning
        queries.insert(trimmed, at: 0)
        
        // Trim to max items
        if queries.count > maxItems {
            queries = Array(queries.prefix(maxItems))
        }
        
        save()
    }
    
    func remove(_ query: String) {
        queries.removeAll { $0 == query }
        save()
    }
    
    func clear() {
        queries = []
        save()
    }
    
    func search(_ text: String) -> [String] {
        guard !text.isEmpty else { return queries }
        
        let lowercased = text.lowercased()
        return queries.filter { $0.lowercased().contains(lowercased) }
    }
    
    // MARK: - Private Methods
    
    private func load() {
        queries = UserDefaults.standard.stringArray(forKey: storageKey) ?? []
    }
    
    private func save() {
        UserDefaults.standard.set(queries, forKey: storageKey)
    }
}
