import SwiftUI

struct OnboardingView: View {
    @Binding var hasCompletedOnboarding: Bool
    @State private var currentPage = 0
    
    let pages = [
        OnboardingPage(
            title: "ask anything",
            description: "get instant answers about your campus",
            icon: "message.fill"
        ),
        OnboardingPage(
            title: "real-time data",
            description: "know what's happening right now",
            icon: "clock.fill"
        ),
        OnboardingPage(
            title: "smart alerts",
            description: "get notified when things change",
            icon: "bell.fill"
        )
    ]
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<pages.count, id: \.self) { index in
                    VStack(spacing: 24) {
                        Image(systemName: pages[index].icon)
                            .font(.system(size: 80))
                            .foregroundColor(.blue)
                        
                        Text(pages[index].title)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(pages[index].description)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .tag(index)
                }
            }
            .tabViewStyle(.page)
            
            Button(action: {
                if currentPage < pages.count - 1 {
                    currentPage += 1
                } else {
                    hasCompletedOnboarding = true
                }
            }) {
                Text(currentPage < pages.count - 1 ? "next" : "get started")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}

struct OnboardingPage {
    let title: String
    let description: String
    let icon: String
}
