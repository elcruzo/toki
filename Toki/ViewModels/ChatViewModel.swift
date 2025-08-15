import Foundation

@MainActor
class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var isLoading = false
    
    func send(_ query: String) async {
        let userMessage = Message(content: query, isUser: true)
        messages.append(userMessage)
        
        isLoading = true
        
        do {
            let response = try await APIService.shared.ask(query)
            let botMessage = Message(content: response, isUser: false)
            messages.append(botMessage)
        } catch {
            let errorMessage = Message(content: "sorry, something went wrong", isUser: false)
            messages.append(errorMessage)
        }
        
        isLoading = false
    }
    
    func clear() {
        messages = []
    }
}
