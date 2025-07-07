import SwiftUI

struct ProfileView: View {
    @State private var university = "Howard University"
    
    var body: some View {
        NavigationStack {
            List {
                Section("account") {
                    HStack {
                        Text("university")
                        Spacer()
                        Text(university)
                            .foregroundColor(.secondary)
                    }
                }
                
                Section("preferences") {
                    Toggle("notifications", isOn: .constant(true))
                    Toggle("dark mode", isOn: .constant(false))
                }
                
                Section("about") {
                    Link("privacy policy", destination: URL(string: "https://toki.app/privacy")!)
                    Link("terms of service", destination: URL(string: "https://toki.app/terms")!)
                }
            }
            .navigationTitle("profile")
        }
    }
}
