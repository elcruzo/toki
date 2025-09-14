import SwiftUI

struct SettingsView: View {
    @AppStorage("notifications") private var notifications = true
    @AppStorage("haptics") private var haptics = true
    @StateObject private var auth = AuthService.shared
    
    var body: some View {
        NavigationStack {
            List {
                Section("preferences") {
                    Toggle("notifications", isOn: $notifications)
                    Toggle("haptic feedback", isOn: $haptics)
                }
                
                Section("account") {
                    if let user = auth.currentUser {
                        HStack {
                            Text("email")
                            Spacer()
                            Text(user.email)
                                .foregroundColor(.secondary)
                        }
                        HStack {
                            Text("university")
                            Spacer()
                            Text(user.university)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Button("sign out", role: .destructive) {
                        auth.signOut()
                    }
                }
                
                Section("about") {
                    HStack {
                        Text("version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.secondary)
                    }
                    Link("privacy policy", destination: URL(string: "https://toki.app/privacy")!)
                    Link("terms of service", destination: URL(string: "https://toki.app/terms")!)
                }
            }
            .navigationTitle("settings")
        }
    }
}
