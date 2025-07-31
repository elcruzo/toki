import SwiftUI

struct EventsView: View {
    @State private var events: [Event] = []
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List(events) { event in
                VStack(alignment: .leading, spacing: 8) {
                    Text(event.title)
                        .font(.headline)
                    
                    HStack {
                        Image(systemName: "mappin")
                        Text(event.location)
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                    
                    HStack {
                        Image(systemName: "clock")
                        Text(event.startTime, style: .time)
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                    
                    if event.isFree {
                        Text("free")
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.green.opacity(0.2))
                            .cornerRadius(4)
                    }
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("events")
            .searchable(text: $searchText)
            .task {
                await loadEvents()
            }
        }
    }
    
    func loadEvents() async {
        do {
            events = try await EventService.shared.getUpcoming()
        } catch {
            print("error: \(error)")
        }
    }
}
