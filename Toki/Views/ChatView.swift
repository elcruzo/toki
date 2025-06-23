import SwiftUI

struct ChatView: View {
    @State private var query = ""
    @State private var messages: [Message] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(messages) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding()
                }
                
                HStack {
                    TextField("ask anything...", text: $query)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(action: sendMessage) {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.title2)
                    }
                }
                .padding()
            }
            .navigationTitle("toki")
        }
    }
    
    func sendMessage() {
        guard !query.isEmpty else { return }
        let userMessage = Message(content: query, isUser: true)
        messages.append(userMessage)
        query = ""
    }
}
