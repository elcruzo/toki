import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    @State private var query = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 12) {
                            ForEach(viewModel.messages) { message in
                                MessageBubble(message: message)
                                    .id(message.id)
                            }
                            
                            if viewModel.isLoading {
                                HStack {
                                    ProgressView()
                                    Text("thinking...")
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        .padding()
                    }
                }
                
                HStack {
                    TextField("ask anything...", text: $query)
                        .textFieldStyle(.roundedBorder)
                        .onSubmit { sendMessage() }
                    
                    Button(action: sendMessage) {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.title2)
                    }
                    .disabled(query.isEmpty || viewModel.isLoading)
                }
                .padding()
            }
            .navigationTitle("toki")
        }
    }
    
    func sendMessage() {
        guard !query.isEmpty else { return }
        let q = query
        query = ""
        Task {
            await viewModel.send(q)
        }
    }
}
