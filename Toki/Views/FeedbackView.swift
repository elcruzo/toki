import SwiftUI

struct FeedbackView: View {
    @Environment(\.dismiss) var dismiss
    @State private var feedback = ""
    @State private var rating = 0
    
    var body: some View {
        NavigationStack {
            Form {
                Section("rating") {
                    HStack {
                        ForEach(1...5, id: \.self) { star in
                            Image(systemName: star <= rating ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .onTapGesture { rating = star }
                        }
                    }
                    .font(.title2)
                }
                
                Section("feedback") {
                    TextEditor(text: $feedback)
                        .frame(minHeight: 100)
                }
            }
            .navigationTitle("feedback")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("cancel") { dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("submit") { dismiss() }
                }
            }
        }
    }
}
