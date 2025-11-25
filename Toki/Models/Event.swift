import Foundation

// MARK: - Event

struct Event: Identifiable, Codable, Equatable {
    let id: String
    let title: String
    let description: String
    let location: String
    let startTime: Date
    let endTime: Date
    let category: EventCategory
    let isFree: Bool
    let imageURL: URL?
    
    var isHappeningNow: Bool {
        let now = Date()
        return startTime <= now && now <= endTime
    }
    
    var isUpcoming: Bool {
        startTime > Date()
    }
    
    var duration: TimeInterval {
        endTime.timeIntervalSince(startTime)
    }
    
    var formattedDuration: String {
        let hours = Int(duration / 3600)
        let minutes = Int((duration.truncatingRemainder(dividingBy: 3600)) / 60)
        
        if hours > 0 && minutes > 0 {
            return "\(hours)h \(minutes)m"
        } else if hours > 0 {
            return "\(hours)h"
        } else {
            return "\(minutes)m"
        }
    }
    
    var formattedTimeRange: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return "\(formatter.string(from: startTime)) - \(formatter.string(from: endTime))"
    }
}

// MARK: - Event Category

enum EventCategory: String, Codable, CaseIterable {
    case academic
    case social
    case sports
    case career
    case arts
    case other
    
    var displayName: String {
        switch self {
        case .academic: return "Academic"
        case .social: return "Social"
        case .sports: return "Sports"
        case .career: return "Career"
        case .arts: return "Arts"
        case .other: return "Other"
        }
    }
    
    var icon: String {
        switch self {
        case .academic: return "book"
        case .social: return "person.3"
        case .sports: return "sportscourt"
        case .career: return "briefcase"
        case .arts: return "paintpalette"
        case .other: return "star"
        }
    }
}
