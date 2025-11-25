import SwiftUI

struct AlertsView: View {
    @State private var alerts: [TokiAlert] = []
    @State private var showingCreateSheet = false
    
    var body: some View {
        NavigationStack {
            Group {
                if alerts.isEmpty {
                    emptyState
                } else {
                    alertsList
                }
            }
            .navigationTitle("Alerts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingCreateSheet = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingCreateSheet) {
                CreateAlertView { newAlert in
                    alerts.append(newAlert)
                }
            }
        }
    }
    
    // MARK: - Empty State
    
    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "bell.slash")
                .font(.system(size: 48))
                .foregroundColor(.secondary)
            
            Text("No alerts yet")
                .font(.headline)
            
            Text("Create alerts to get notified about campus events")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Button("Create Alert") {
                showingCreateSheet = true
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
    // MARK: - Alerts List
    
    private var alertsList: some View {
        List {
            ForEach($alerts) { $alert in
                AlertRow(alert: $alert)
            }
            .onDelete(perform: deleteAlerts)
        }
    }
    
    private func deleteAlerts(at offsets: IndexSet) {
        alerts.remove(atOffsets: offsets)
    }
}

// MARK: - Alert Row

private struct AlertRow: View {
    @Binding var alert: TokiAlert
    
    var body: some View {
        HStack {
            Image(systemName: alert.type.icon)
                .foregroundColor(.accentColor)
                .frame(width: 32)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(alert.condition)
                    .font(.headline)
                
                Text(alert.type.displayName)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Toggle("", isOn: $alert.isActive)
                .labelsHidden()
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Create Alert View

struct CreateAlertView: View {
    @Environment(\.dismiss) private var dismiss
    
    let onCreate: (TokiAlert) -> Void
    
    @State private var selectedType: AlertType = .classOpen
    @State private var condition = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Alert Type") {
                    Picker("Type", selection: $selectedType) {
                        ForEach(AlertType.allCases, id: \.self) { type in
                            Label(type.displayName, systemImage: type.icon)
                                .tag(type)
                        }
                    }
                    .pickerStyle(.inline)
                    .labelsHidden()
                }
                
                Section("Condition") {
                    TextField(selectedType.placeholder, text: $condition)
                }
            }
            .navigationTitle("New Alert")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") { saveAlert() }
                        .disabled(condition.isEmpty)
                }
            }
        }
    }
    
    private func saveAlert() {
        let alert = TokiAlert(
            id: UUID().uuidString,
            type: selectedType,
            condition: condition,
            isActive: true,
            createdAt: Date()
        )
        onCreate(alert)
        dismiss()
    }
}

#Preview {
    AlertsView()
}
