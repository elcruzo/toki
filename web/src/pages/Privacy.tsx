import '../index.css'

function Privacy() {
  return (
    <div className="min-h-screen bg-cream">
      <nav className="fixed top-0 left-0 right-0 z-50 bg-cream/80 backdrop-blur-sm border-b border-brown-200/50">
        <div className="max-w-6xl mx-auto px-6 py-4 flex items-center justify-between">
          <a href="/" className="text-2xl font-semibold text-brown-900">toki</a>
        </div>
      </nav>

      <main className="pt-32 pb-20 px-6">
        <div className="max-w-3xl mx-auto">
          <h1 className="text-4xl md:text-5xl font-semibold text-brown-900 mb-8">privacy policy</h1>
          <p className="text-brown-500 mb-12">last updated: february 2026</p>

          <div className="space-y-8 text-brown-700 leading-relaxed">
            <section>
              <h2 className="text-2xl font-semibold text-brown-900 mb-4">overview</h2>
              <p>
                toki ("we", "our", or "us") is committed to protecting your privacy. this policy explains how we collect, use, and safeguard your information when you use our service.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold text-brown-900 mb-4">information we collect</h2>
              <p className="mb-4">we collect information you provide directly:</p>
              <ul className="list-disc list-inside space-y-2 ml-4">
                <li>email address (when joining the waitlist)</li>
                <li>questions you ask within the app</li>
                <li>campus affiliation</li>
                <li>usage data and preferences</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-semibold text-brown-900 mb-4">how we use your information</h2>
              <p className="mb-4">we use collected information to:</p>
              <ul className="list-disc list-inside space-y-2 ml-4">
                <li>provide and improve our services</li>
                <li>send you updates about toki's launch</li>
                <li>respond to your questions and requests</li>
                <li>analyze usage patterns to enhance the experience</li>
                <li>ensure compliance with university policies</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-semibold text-brown-900 mb-4">data sharing</h2>
              <p>
                we do not sell your personal information. we may share anonymized, aggregated data with partner universities to improve campus services. any data shared with universities is stripped of personally identifiable information.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold text-brown-900 mb-4">data security</h2>
              <p>
                we implement industry-standard security measures to protect your data. all data is encrypted in transit and at rest. we regularly audit our systems and comply with FERPA requirements for educational data.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-semibold text-brown-900 mb-4">your rights</h2>
              <p className="mb-4">you have the right to:</p>
              <ul className="list-disc list-inside space-y-2 ml-4">
                <li>access your personal data</li>
                <li>request deletion of your data</li>
                <li>opt out of marketing communications</li>
                <li>export your data</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-semibold text-brown-900 mb-4">contact</h2>
              <p>
                for privacy-related questions, contact us at{' '}
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

export default Privacy
