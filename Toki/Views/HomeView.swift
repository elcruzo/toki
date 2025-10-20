import SwiftUI

struct HomeView: View {
    @State private var query = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    Text("what do you need?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        TextField("ask anything...", text: $query)
                            .textFieldStyle(.roundedBorder)
                        
                        NavigationLink(destination: ChatView()) {
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.title2)
                        }
                    }
                    .padding(.horizontal)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(defaultQuickActions) { action in
                            VStack {
                                Image(systemName: action.icon)
                                    .font(.title)
                                Text(action.title)
                                    .font(.caption)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
            .navigationTitle("toki")
        }
    }
}
