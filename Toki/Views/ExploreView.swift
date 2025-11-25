import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ],
                    spacing: 16
                ) {
                    ForEach(QuickAction.defaults) { action in
                        NavigationLink(destination: ChatView()) {
                            CategoryCard(action: action)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("Explore")
        }
    }
}

// MARK: - Category Card

private struct CategoryCard: View {
    let action: QuickAction
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: action.icon)
                .font(.system(size: 28))
                .foregroundColor(.accentColor)
            
            Text(action.title)
                .font(.headline)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .background(Color(.systemGray6))
        .cornerRadius(16)
    }
}

#Preview {
    ExploreView()
}
