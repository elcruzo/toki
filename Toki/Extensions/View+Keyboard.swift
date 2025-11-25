import SwiftUI

// MARK: - Keyboard Dismissal

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
    
    func onTapToDismissKeyboard() -> some View {
        self.onTapGesture {
            hideKeyboard()
        }
    }
}
