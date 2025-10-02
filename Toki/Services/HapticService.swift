import UIKit

class HapticService {
    static let shared = HapticService()
    
    func impact(_ style: UIImpactFeedbackGenerator.FeedbackStyle = .medium) {
        guard UserDefaults.standard.bool(forKey: "haptics") else { return }
        UIImpactFeedbackGenerator(style: style).impactOccurred()
    }
    
    func notification(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        guard UserDefaults.standard.bool(forKey: "haptics") else { return }
        UINotificationFeedbackGenerator().notificationOccurred(type)
    }
    
    func selection() {
        guard UserDefaults.standard.bool(forKey: "haptics") else { return }
        UISelectionFeedbackGenerator().selectionChanged()
    }
}
