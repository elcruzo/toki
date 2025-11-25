import Foundation

// MARK: - Message

struct Message: Identifiable, Equatable {
    let id: UUID
    let content: String
    let isUser: Bool
    let timestamp: Date
    
    init(id: UUID = UUID(), content: String, isUser: Bool, timestamp: Date = Date()) {
        self.id = id
        self.content = content
        self.isUser = isUser
        self.timestamp = timestamp
    }
    
    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: timestamp)
    }
}

// MARK: - Conversation

struct Conversation: Identifiable, Equatable {
    let id: UUID
    var messages: [Message]
    let createdAt: Date
    var updatedAt: Date
    
    init(id: UUID = UUID(), messages: [Message] = [], createdAt: Date = Date()) {
        self.id = id
        self.messages = messages
        self.createdAt = createdAt
        self.updatedAt = createdAt
    }
    
    var lastMessage: Message? {
        messages.last
    }
    
    var preview: String {
        lastMessage?.content ?? "New conversation"
    }
    
    mutating func addMessage(_ message: Message) {
        messages.append(message)
        updatedAt = Date()
    }
}
