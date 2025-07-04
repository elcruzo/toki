import SwiftUI

struct ExploreView: View {
    let categories = ["dining", "library", "events", "shuttle", "study rooms"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(categories, id: \.self) { category in
                        CategoryCard(title: category)
                    }
                }
                .padding()
            }
            .navigationTitle("explore")
        }
    }
}

struct CategoryCard: View {
    let title: String
    
    var body: some View {
        VStack {
            Image(systemName: iconFor(title))
                .font(.largeTitle)
            Text(title)
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
    
    func iconFor(_ category: String) -> String {
        switch category {
        case "dining": return "fork.knife"
        case "library": return "books.vertical"
        case "events": return "calendar"
        case "shuttle": return "bus"
        case "study rooms": return "person.3"
        default: return "questionmark"
        }
    }
}
