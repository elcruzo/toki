import Foundation

class CacheService {
    static let shared = CacheService()
    private let cache = NSCache<NSString, CacheEntry>()
    private let ttl: TimeInterval = 300
    
    func get<T: Codable>(_ key: String) -> T? {
        guard let entry = cache.object(forKey: key as NSString) else { return nil }
        guard Date() < entry.expiry else {
            cache.removeObject(forKey: key as NSString)
            return nil
        }
        return try? JSONDecoder().decode(T.self, from: entry.data)
    }
    
    func set<T: Codable>(_ key: String, value: T) {
        guard let data = try? JSONEncoder().encode(value) else { return }
        let entry = CacheEntry(data: data, expiry: Date().addingTimeInterval(ttl))
        cache.setObject(entry, forKey: key as NSString)
    }
    
    func clear() {
        cache.removeAllObjects()
    }
}

class CacheEntry: NSObject {
    let data: Data
    let expiry: Date
    
    init(data: Data, expiry: Date) {
        self.data = data
        self.expiry = expiry
    }
}
// offline support
