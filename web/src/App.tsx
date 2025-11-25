import './index.css'

function App() {
  return (
    <div className="min-h-screen bg-cream">
      {/* Nav */}
      <nav className="fixed top-0 left-0 right-0 z-50 bg-cream/80 backdrop-blur-sm border-b border-brown-200/50">
        <div className="max-w-6xl mx-auto px-6 py-4 flex items-center justify-between">
          <a href="/" className="text-2xl font-semibold text-brown-900">toki</a>
          <div className="flex items-center gap-8">
            <a href="#features" className="text-brown-700 hover:text-brown-900 transition-colors">features</a>
            <a href="#how" className="text-brown-700 hover:text-brown-900 transition-colors">how it works</a>
            <a 
              href="https://forms.gle/your-waitlist-form" 
              target="_blank"
              rel="noopener noreferrer"
              className="px-5 py-2 bg-brown-900 text-cream rounded-full hover:bg-brown-800 transition-colors"
            >
              join waitlist
            </a>
          </div>
        </div>
      </nav>

      {/* Hero */}
      <section className="pt-32 pb-20 px-6">
        <div className="max-w-4xl mx-auto text-center">
          <h1 className="text-5xl md:text-7xl font-semibold text-brown-900 leading-tight mb-6">
            your campus,<br />answered.
          </h1>
          <p className="text-xl md:text-2xl text-brown-600 max-w-2xl mx-auto mb-10">
            one app where you ask anything about your campus and get instant, accurate answers.
          </p>
          <div className="flex flex-col sm:flex-row items-center justify-center gap-4">
            <a 
              href="https://forms.gle/your-waitlist-form"
              target="_blank"
              rel="noopener noreferrer"
              className="px-8 py-4 bg-brown-900 text-cream text-lg rounded-full hover:bg-brown-800 transition-colors"
            >
              join the waitlist
            </a>
            <span className="text-brown-500">3,200+ students waiting</span>
          </div>
        </div>
      </section>

      {/* Demo Questions */}
      <section className="py-16 px-6 bg-brown-100/50">
        <div className="max-w-4xl mx-auto">
          <div className="grid md:grid-cols-2 gap-4">
            {[
              "is the library busy right now?",
              "what's for lunch at the cafe?",
              "when's the next shuttle?",
              "are there study rooms available?",
              "how do i appeal a grade?",
              "what events are happening today?",
            ].map((q, i) => (
              <div 
                key={i}
                className="p-5 bg-cream rounded-2xl border border-brown-200/50 text-brown-700"
              >
                "{q}"
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Features */}
      <section id="features" className="py-24 px-6">
        <div className="max-w-5xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-semibold text-brown-900 text-center mb-16">
            everything you need to know, instantly
          </h2>
          <div className="grid md:grid-cols-3 gap-8">
            {[
              {
                title: "ask anything",
                desc: "natural language questions about dining, classes, events, shuttles, and more.",
                icon: "💬"
              },
              {
                title: "real-time data",
                desc: "live occupancy, wait times, and availability. not estimates—actual data.",
                icon: "⚡"
              },
              {
                title: "smart alerts",
                desc: "get notified when a class opens, the library quiets down, or your shuttle arrives.",
                icon: "🔔"
              },
            ].map((f, i) => (
              <div key={i} className="text-center">
                <div className="text-4xl mb-4">{f.icon}</div>
                <h3 className="text-xl font-semibold text-brown-900 mb-2">{f.title}</h3>
                <p className="text-brown-600">{f.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* How it works */}
      <section id="how" className="py-24 px-6 bg-brown-900 text-cream">
        <div className="max-w-4xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-semibold text-center mb-16">
            how it works
          </h2>
          <div className="space-y-12">
            {[
              { num: "01", title: "ask", desc: "type any question about your campus in plain english." },
              { num: "02", title: "understand", desc: "our ai processes your question and searches campus data sources." },
              { num: "03", title: "answer", desc: "get an instant, accurate response with real-time information." },
            ].map((step, i) => (
              <div key={i} className="flex items-start gap-6">
                <span className="text-brown-400 text-sm font-mono">{step.num}</span>
                <div>
                  <h3 className="text-2xl font-semibold mb-2">{step.title}</h3>
                  <p className="text-brown-300">{step.desc}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Stats */}
      <section className="py-24 px-6">
        <div className="max-w-4xl mx-auto">
          <div className="grid md:grid-cols-3 gap-8 text-center">
            <div>
              <div className="text-5xl font-semibold text-brown-900 mb-2">3,200+</div>
              <div className="text-brown-600">students on waitlist</div>
            </div>
            <div>
              <div className="text-5xl font-semibold text-brown-900 mb-2">10,000</div>
              <div className="text-brown-600">students at pilot campus</div>
            </div>
            <div>
              <div className="text-5xl font-semibold text-brown-900 mb-2">3+ hrs</div>
              <div className="text-brown-600">saved daily per student</div>
            </div>
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="py-24 px-6 bg-brown-100/50">
        <div className="max-w-3xl mx-auto text-center">
          <h2 className="text-3xl md:text-4xl font-semibold text-brown-900 mb-6">
            stop searching. start asking.
          </h2>
          <p className="text-xl text-brown-600 mb-10">
            join thousands of students waiting for a better way to navigate campus life.
          </p>
          <a 
            href="https://forms.gle/your-waitlist-form"
            target="_blank"
            rel="noopener noreferrer"
            className="inline-block px-8 py-4 bg-brown-900 text-cream text-lg rounded-full hover:bg-brown-800 transition-colors"
          >
            join the waitlist
          </a>
        </div>
      </section>

      {/* Footer */}
      <footer className="py-12 px-6 border-t border-brown-200/50">
        <div className="max-w-6xl mx-auto flex flex-col md:flex-row items-center justify-between gap-6">
          <div className="text-brown-900 font-semibold text-xl">toki</div>
          <div className="flex items-center gap-6 text-brown-600 text-sm">
            <a href="mailto:ayomideadekoya266@gmail.com" className="hover:text-brown-900 transition-colors">contact</a>
            <a href="/privacy" className="hover:text-brown-900 transition-colors">privacy</a>
            <a href="/terms" className="hover:text-brown-900 transition-colors">terms</a>
          </div>
          <div className="text-brown-500 text-sm">
            © 2025 toki
          </div>
        </div>
      </footer>
    </div>
  )
}

export default App
