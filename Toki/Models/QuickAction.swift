import Foundation

struct QuickAction: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let query: String
}

let defaultQuickActions = [
    QuickAction(title: "library", icon: "books.vertical", query: "is the library busy?"),
    QuickAction(title: "dining", icon: "fork.knife", query: "what's for lunch?"),
    QuickAction(title: "shuttle", icon: "bus", query: "when's the next shuttle?"),
    QuickAction(title: "events", icon: "calendar", query: "what's happening today?")
]
