import SwiftUI

struct SignInView: View {
    @EnvironmentObject private var authService: AuthService
    
    @State private var email = ""
    @State private var password = ""
    @FocusState private var focusedField: Field?
    
    private enum Field {
        case email, password
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Spacer()
                
                header
                
                Spacer()
                
                form
                
                Spacer()
                
                footer
            }
            .padding()
        }
    }
    
    // MARK: - Header
    
    private var header: some View {
        VStack(spacing: 8) {
            Text("toki")
                .font(.system(size: 48, weight: .bold, design: .serif))
            
            Text("your campus, answered")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
    
    // MARK: - Form
    
    private var form: some View {
        VStack(spacing: 16) {
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .autocorrectionDisabled()
                .focused($focusedField, equals: .email)
                .submitLabel(.next)
                .onSubmit { focusedField = .password }
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .textContentType(.password)
                .focused($focusedField, equals: .password)
                .submitLabel(.go)
                .onSubmit { signIn() }
            
            if let error = authService.error {
                Text(error.localizedDescription)
                    .font(.caption)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
            
            Button(action: signIn) {
                Group {
                    if authService.isLoading {
                        ProgressView()
                            .tint(.white)
                    } else {
                        Text("Sign In")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
            }
            .buttonStyle(.borderedProminent)
            .disabled(!canSignIn)
        }
    }
    
    // MARK: - Footer
    
    private var footer: some View {
        Text("Use your .edu email to sign in")
            .font(.caption)
            .foregroundColor(.secondary)
    }
    
    // MARK: - Helpers
    
    private var canSignIn: Bool {
        !email.isEmpty && !password.isEmpty && !authService.isLoading
    }
    
    private func signIn() {
        guard canSignIn else { return }
        
        Task {
            await authService.signIn(email: email, password: password)
        }
    }
}

#Preview {
    SignInView()
        .environmentObject(AuthService.shared)
}
