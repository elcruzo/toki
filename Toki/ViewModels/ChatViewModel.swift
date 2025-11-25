import Foundation

// MARK: - Chat View Model

@MainActor
final class ChatViewModel: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var isLoading = false
    @Published private(set) var error: Error?
    
    private let apiService: APIService
    
    init(apiService: APIService = .shared) {
        self.apiService = apiService
    }
    
    // MARK: - Public Methods
    
    func send(_ query: String) async {
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedQuery.isEmpty else { return }
        
        // Add user message
        let userMessage = Message(content: trimmedQuery, isUser: true)
        messages.append(userMessage)
        
        isLoading = true
        error = nil
        
        do {
            let response = try await apiService.ask(trimmedQuery)
            let botMessage = Message(content: response, isUser: false)
            messages.append(botMessage)
        } catch {
            self.error = error
            let errorMessage = Message(
                content: "Sorry, I couldn't process your request. Please try again.",
                isUser: false
            )
            messages.append(errorMessage)
        }
        
        isLoading = false
    }
    
    func clear() {
        messages = []
        error = nil
    }
    
    func retry() async {
        guard let lastUserMessage = messages.last(where: { $0.isUser }) else { return }
        
        // Remove the error message if present
        if let lastMessage = messages.last, !lastMessage.isUser {
            messages.removeLast()
        }
        
        // Remove the last user message to re-send
        if let index = messages.lastIndex(where: { $0.isUser }) {
            messages.remove(at: index)
        }
        
        await send(lastUserMessage.content)
    }
}
