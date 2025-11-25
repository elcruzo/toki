import Foundation

// MARK: - Campus

struct Campus: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let shortName: String
    let location: String
    let studentCount: Int
    
    var formattedStudentCount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: studentCount)) ?? "\(studentCount)"
    }
}

// MARK: - Dining

struct DiningHall: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let isOpen: Bool
    let currentWait: Int?
    let menu: [MenuItem]
    
    var waitTimeDescription: String? {
        guard let wait = currentWait else { return nil }
        return "\(wait) min wait"
    }
    
    var statusDescription: String {
        isOpen ? "Open" : "Closed"
    }
}

struct MenuItem: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let station: String
}

// MARK: - Library

struct LibraryOccupancy: Codable, Equatable {
    let current: Int
    let capacity: Int
    let trend: OccupancyTrend
    
    var percentage: Double {
        guard capacity > 0 else { return 0 }
        return Double(current) / Double(capacity)
    }
    
    var percentageString: String {
        "\(Int(percentage * 100))%"
    }
    
    var isBusy: Bool {
        percentage > 0.7
    }
}

enum OccupancyTrend: String, Codable {
    case increasing
    case decreasing
    case stable
    
    var description: String {
        switch self {
        case .increasing: return "Getting busier"
        case .decreasing: return "Clearing out"
        case .stable: return "Stable"
        }
    }
    
    var icon: String {
        switch self {
        case .increasing: return "arrow.up"
        case .decreasing: return "arrow.down"
        case .stable: return "minus"
        }
    }
}

struct StudyRoom: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let floor: Int
    let capacity: Int
    let isAvailable: Bool
    
    var floorDescription: String {
        "Floor \(floor)"
    }
    
    var capacityDescription: String {
        "\(capacity) seats"
    }
}

// MARK: - Shuttle

struct ShuttleRoute: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let color: String
    let stops: [ShuttleStop]
}

struct ShuttleStop: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let latitude: Double
    let longitude: Double
}

struct ShuttleArrival: Identifiable, Codable, Equatable {
    let id: String
    let routeName: String
    let minutesAway: Int
    
    var arrivalDescription: String {
        if minutesAway <= 0 {
            return "Arriving now"
        } else if minutesAway == 1 {
            return "1 minute"
        } else {
            return "\(minutesAway) minutes"
        }
    }
}
