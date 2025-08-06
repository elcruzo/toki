import SwiftUI
import MapKit

struct ShuttleView: View {
    @State private var routes: [ShuttleRoute] = []
    @State private var selectedRoute: ShuttleRoute?
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 38.9217, longitude: -77.0200),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Map(coordinateRegion: $region, annotationItems: selectedRoute?.stops ?? []) { stop in
                    MapMarker(coordinate: CLLocationCoordinate2D(
                        latitude: stop.latitude,
                        longitude: stop.longitude
                    ))
                }
                .frame(height: 300)
                
                List(routes) { route in
                    Button(action: { selectedRoute = route }) {
                        HStack {
                            Circle()
                                .fill(Color(hex: route.color))
                                .frame(width: 12, height: 12)
                            Text(route.name)
                            Spacer()
                            if selectedRoute?.id == route.id {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            }
            .navigationTitle("shuttle")
            .task {
                await loadRoutes()
            }
        }
    }
    
    func loadRoutes() async {
        do {
            routes = try await ShuttleService.shared.getRoutes()
            selectedRoute = routes.first
        } catch {
            print("error: \(error)")
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        self.init(
            red: Double((rgb >> 16) & 0xFF) / 255,
            green: Double((rgb >> 8) & 0xFF) / 255,
            blue: Double(rgb & 0xFF) / 255
        )
    }
}
