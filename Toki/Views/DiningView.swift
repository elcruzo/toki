import SwiftUI

struct DiningView: View {
    @State private var halls: [DiningHall] = []
    @State private var isLoading = true
    
    var body: some View {
        NavigationStack {
            Group {
                if isLoading {
                    ProgressView()
                } else {
                    List(halls) { hall in
                        NavigationLink(destination: MenuView(hall: hall)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(hall.name)
                                        .font(.headline)
                                    if let wait = hall.currentWait {
                                        Text("\(wait) min wait")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                Spacer()
                                Circle()
                                    .fill(hall.isOpen ? Color.green : Color.red)
                                    .frame(width: 10, height: 10)
                            }
                        }
                    }
                }
            }
            .navigationTitle("dining")
            .task {
                await loadHalls()
            }
        }
    }
    
    func loadHalls() async {
        do {
            halls = try await DiningService.shared.getHalls()
        } catch {
            print("error loading halls: \(error)")
        }
        isLoading = false
    }
}

struct MenuView: View {
    let hall: DiningHall
    
    var body: some View {
        List(hall.menu) { item in
            VStack(alignment: .leading) {
                Text(item.name)
                Text(item.station)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle(hall.name)
    }
}
