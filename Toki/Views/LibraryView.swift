import SwiftUI

struct LibraryView: View {
    @State private var occupancy: LibraryOccupancy?
    @State private var rooms: [StudyRoom] = []
    
    var body: some View {
        NavigationStack {
            List {
                if let occ = occupancy {
                    Section("occupancy") {
                        HStack {
                            Text("\(occ.current)/\(occ.capacity)")
                                .font(.title)
                            Spacer()
                            Text(occ.trend)
                                .foregroundColor(.secondary)
                        }
                        
                        ProgressView(value: Double(occ.current), total: Double(occ.capacity))
                    }
                }
                
                Section("study rooms") {
                    ForEach(rooms) { room in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(room.name)
                                Text("floor \(room.floor) • \(room.capacity) seats")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            if room.isAvailable {
                                Button("book") {
                                    // book room
                                }
                                .buttonStyle(.borderedProminent)
                            } else {
                                Text("occupied")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("library")
            .task {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        do {
            occupancy = try await LibraryService.shared.getOccupancy()
            rooms = try await LibraryService.shared.getStudyRooms()
        } catch {
            print("error: \(error)")
        }
    }
}
