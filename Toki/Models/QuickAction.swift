import Foundation

// MARK: - Quick Action

struct QuickAction: Identifiable, Equatable {
    let id: String
    let title: String
    let icon: String
    let query: String
    
    init(id: String = UUID().uuidString, title: String, icon: String, query: String) {
        self.id = id
        self.title = title
        self.icon = icon
        self.query = query
    }
}

// MARK: - Default Quick Actions

extension QuickAction {
    static let defaults: [QuickAction] = [
        QuickAction(
            id: "library",
            title: "Library",
            icon: "books.vertical",
            query: "Is the library busy right now?"
        ),
        QuickAction(
            id: "dining",
            title: "Dining",
            icon: "fork.knife",
            query: "What's for lunch today?"
        ),
        QuickAction(
            id: "shuttle",
            title: "Shuttle",
            icon: "bus",
            query: "When's the next shuttle?"
        ),
        QuickAction(
            id: "events",
            title: "Events",
            icon: "calendar",
            query: "What events are happening today?"
        ),
        QuickAction(
            id: "study-rooms",
            title: "Study Rooms",
            icon: "person.3",
            query: "Are there any study rooms available?"
        ),
        QuickAction(
            id: "hours",
            title: "Hours",
            icon: "clock",
            query: "What are the library hours today?"
        ),
    ]
}
