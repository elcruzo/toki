import SwiftUI

@main
struct TokiApp: App {
    @StateObject private var authService = AuthService.shared
    
    var body: some Scene {
        WindowGroup {
            Group {
                if authService.isAuthenticated {
                    ContentView()
                } else {
                    SignInView()
                }
            }
            .environmentObject(authService)
        }
    }
}
