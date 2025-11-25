import SwiftUI

// MARK: - Chat View

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    @State private var query = ""
    @FocusState private var isInputFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                messageList
                inputBar
            }
            .navigationTitle("toki")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    clearButton
                }
            }
        }
    }
    
    // MARK: - Message List
    
    private var messageList: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    if viewModel.messages.isEmpty {
                        emptyState
                    } else {
                        ForEach(viewModel.messages) { message in
                            MessageBubble(message: message)
                                .id(message.id)
                        }
                    }
                    
                    if viewModel.isLoading {
                        loadingIndicator
                    }
                }
                .padding()
            }
            .onChange(of: viewModel.messages.count) { _, _ in
                scrollToBottom(proxy: proxy)
            }
        }
    }
    
    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "message")
                .font(.system(size: 48))
                .foregroundColor(.secondary)
            
            Text("Ask anything about campus")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("Try: \"Is the library busy?\"")
                .font(.subheadline)
                .foregroundColor(.tertiary)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 100)
    }
    
    private var loadingIndicator: some View {
        HStack(spacing: 8) {
            ProgressView()
                .scaleEffect(0.8)
            Text("thinking...")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.leading, 4)
    }
    
    // MARK: - Input Bar
    
    private var inputBar: some View {
        HStack(spacing: 12) {
            TextField("ask anything...", text: $query)
                .textFieldStyle(.roundedBorder)
                .focused($isInputFocused)
                .onSubmit(sendMessage)
                .submitLabel(.send)
            
            Button(action: sendMessage) {
                Image(systemName: "arrow.up.circle.fill")
                    .font(.title2)
                    .foregroundColor(canSend ? .accentColor : .secondary)
            }
            .disabled(!canSend)
        }
        .padding()
        .background(Color(.systemBackground))
    }
    
    private var clearButton: some View {
        Button(action: { viewModel.clear() }) {
            Image(systemName: "trash")
        }
        .disabled(viewModel.messages.isEmpty)
    }
    
    // MARK: - Helpers
    
    private var canSend: Bool {
        !query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !viewModel.isLoading
    }
    
    private func sendMessage() {
        guard canSend else { return }
        let messageToSend = query
        query = ""
        
        Task {
            await viewModel.send(messageToSend)
        }
    }
    
    private func scrollToBottom(proxy: ScrollViewProxy) {
        guard let lastMessage = viewModel.messages.last else { return }
        withAnimation(.easeOut(duration: 0.2)) {
            proxy.scrollTo(lastMessage.id, anchor: .bottom)
        }
    }
}

// MARK: - Message Bubble

struct MessageBubble: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isUser { Spacer(minLength: 60) }
            
            VStack(alignment: message.isUser ? .trailing : .leading, spacing: 4) {
                Text(message.content)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(backgroundColor)
                    .foregroundColor(textColor)
                    .cornerRadius(18)
                
                Text(message.formattedTime)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            
            if !message.isUser { Spacer(minLength: 60) }
        }
    }
    
    private var backgroundColor: Color {
        message.isUser ? .accentColor : Color(.systemGray5)
    }
    
    private var textColor: Color {
        message.isUser ? .white : .primary
    }
}

// MARK: - Preview

#Preview {
    ChatView()
}
