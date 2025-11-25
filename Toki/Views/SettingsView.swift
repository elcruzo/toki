import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var authService: AuthService
    @AppStorage("notificationsEnabled") private var notificationsEnabled = true
    @AppStorage("hapticsEnabled") private var hapticsEnabled = true
    
    var body: some View {
        NavigationStack {
            List {
                accountSection
                preferencesSection
                aboutSection
                signOutSection
            }
            .navigationTitle("Settings")
        }
    }
    
    // MARK: - Account Section
    
    private var accountSection: some View {
        Section("Account") {
            if let user = authService.currentUser {
                LabeledContent("Name", value: user.name)
                LabeledContent("Email", value: user.email)
                LabeledContent("University", value: user.university)
            }
        }
    }
    
    // MARK: - Preferences Section
    
    private var preferencesSection: some View {
        Section("Preferences") {
            Toggle("Notifications", isOn: $notificationsEnabled)
            Toggle("Haptic Feedback", isOn: $hapticsEnabled)
        }
    }
    
    // MARK: - About Section
    
    private var aboutSection: some View {
        Section("About") {
            LabeledContent("Version", value: appVersion)
            
            Link(destination: URL(string: "https://gettoki.app/privacy")!) {
                HStack {
                    Text("Privacy Policy")
                    Spacer()
                    Image(systemName: "arrow.up.right")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Link(destination: URL(string: "https://gettoki.app/terms")!) {
                HStack {
                    Text("Terms of Service")
                    Spacer()
                    Image(systemName: "arrow.up.right")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Link(destination: URL(string: "mailto:support@gettoki.app")!) {
                HStack {
                    Text("Contact Support")
                    Spacer()
                    Image(systemName: "arrow.up.right")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
    
    // MARK: - Sign Out Section
    
    private var signOutSection: some View {
        Section {
            Button("Sign Out", role: .destructive) {
                authService.signOut()
            }
        }
    }
    
    // MARK: - Helpers
    
    private var appVersion: String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
        return "\(version) (\(build))"
    }
}

#Preview {
    SettingsView()
        .environmentObject(AuthService.shared)
}
