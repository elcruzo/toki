import Foundation

// MARK: - String Extensions

extension String {
    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var isValidEmail: Bool {
        let pattern = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return range(of: pattern, options: .regularExpression) != nil
    }
    
    var isEduEmail: Bool {
        lowercased().hasSuffix(".edu")
    }
    
    var nilIfEmpty: String? {
        isEmpty ? nil : self
    }
}
