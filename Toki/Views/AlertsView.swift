import SwiftUI

struct AlertsView: View {
    @State private var alerts: [TokiAlert] = []
    @State private var showingCreate = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(alerts) { alert in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(alert.condition)
                                .font(.headline)
                            Text(alert.type.rawValue.replacingOccurrences(of: "_", with: " "))
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Toggle("", isOn: .constant(alert.isActive))
                    }
                }
                .onDelete(perform: deleteAlert)
            }
            .navigationTitle("alerts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingCreate = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    func deleteAlert(at offsets: IndexSet) {
        alerts.remove(atOffsets: offsets)
    }
}
