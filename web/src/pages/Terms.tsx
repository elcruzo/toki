import '../index.css'

function Terms() {
  return (
    <div className="min-h-screen bg-cream">
      <nav className="fixed top-0 left-0 right-0 z-50 bg-cream/80 backdrop-blur-sm border-b border-brown-200/50">
        <div className="max-w-6xl mx-auto px-6 py-4 flex items-center justify-between">
          <a href="/" className="text-2xl font-semibold text-brown-900">toki</a>
        </div>
      </nav>

      <main className="pt-32 pb-20 px-6">
        <div className="max-w-3xl mx-auto">
          <h1 className="text-4xl md:text-5xl font-semibold text-brown-900 mb-8">terms of service</h1>
          <p className="text-brown-500 mb-12">last updated: february 2026</p>

          <div className="space-y-8 text-brown-700 leading-relaxed">
            <section>
              <h2 className="text-2xl font-semibold text-brown-900 mb-4">acceptance of terms</h2>
              <p>
                by accessing or using toki, you agree to be bound by these terms of service. if you do not agree to these terms, please do not use our service.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold text-brown-900 mb-4">description of service</h2>
              <p>
                toki is an ai-powered answer engine for campus life. we provide information about campus resources, events, dining, and other university-related queries. our service aggregates publicly available campus data and presents it in an accessible format.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold text-brown-900 mb-4">user responsibilities</h2>
              <p className="mb-4">when using toki, you agree to:</p>
              <ul className="list-disc list-inside space-y-2 ml-4">
                <li>provide accurate information when creating an account</li>
                <li>use the service only for lawful purposes</li>
                <li>not attempt to circumvent security measures</li>
                <li>not use the service to harass or harm others</li>
                <li>comply with your university's acceptable use policies</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-semibold text-brown-900 mb-4">accuracy of information</h2>
              <p>
                while we strive to provide accurate and up-to-date information, toki does not guarantee the accuracy, completeness, or timeliness of any information provided. always verify critical information (such as deadlines, office hours, or emergency procedures) with official university sources.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold text-brown-900 mb-4">intellectual property</h2>
              <p>
                the toki service, including its design, features, and content, is owned by toki and protected by intellectual property laws. you may not copy, modify, or distribute our service without permission.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold text-brown-900 mb-4">limitation of liability</h2>
              <p>
                toki is provided "as is" without warranties of any kind. we are not liable for any damages arising from your use of the service, including but not limited to missed deadlines, incorrect information, or service interruptions.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold text-brown-900 mb-4">modifications</h2>
              <p>
                we reserve the right to modify these terms at any time. continued use of toki after changes constitutes acceptance of the new terms. we will notify users of significant changes via email or in-app notification.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold text-brown-900 mb-4">termination</h2>
              <p>
                we may suspend or terminate your access to toki at any time for violation of these terms or for any other reason at our discretion.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold text-brown-900 mb-4">contact</h2>
              <p>
                for questions about these terms, contact us at{' '}
                <a href="mailto:ayomideadekoya266@gmail.com" className="text-brown-900 underline">
                  ayomideadekoya266@gmail.com
                </a>
              </p>
            </section>
          </div>
        </div>
      </main>

      <footer className="py-12 px-6 border-t border-brown-200/50">
        <div className="max-w-6xl mx-auto flex flex-col md:flex-row items-center justify-between gap-6">
          <div className="text-brown-900 font-semibold text-xl">toki</div>
          <div className="flex items-center gap-6 text-brown-600 text-sm">
            <a href="mailto:ayomideadekoya266@gmail.com" className="hover:text-brown-900 transition-colors">
              contact
            </a>
            <a href="/privacy" className="hover:text-brown-900 transition-colors">
              privacy
            </a>
            <a href="/terms" className="hover:text-brown-900 transition-colors">
              terms
            </a>
          </div>
          <div className="text-brown-500 text-sm">
            © {new Date().getFullYear()} toki
          </div>
        </div>
      </footer>
    </div>
  )
}

export default Terms
