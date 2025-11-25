import { useState, type FormEvent } from 'react'
import './index.css'

interface Feature {
  title: string
  description: string
  icon: string
}

interface Step {
  number: string
  title: string
  description: string
}

interface Stat {
  value: string
  label: string
}

interface ThinkingAboutItem {
  title: string
  description: string
}

const FORMSPREE_URL = "https://formspree.io/f/mdaddnwb"

const DEMO_QUESTIONS = [
  "is the library busy right now?",
  "what's for lunch at the cafe?",
  "when's the next shuttle?",
  "are there study rooms available?",
  "how do i appeal a grade?",
  "what events are happening today?",
] as const

const FEATURES: Feature[] = [
  {
    title: "ask anything",
    description: "natural language questions about dining, classes, events, shuttles, and more.",
    icon: "💬"
  },
  {
    title: "real-time data",
    description: "live occupancy, wait times, and availability. not estimates—actual data.",
    icon: "⚡"
  },
  {
    title: "smart alerts",
    description: "get notified when a class opens, the library quiets down, or your shuttle arrives.",
    icon: "🔔"
  },
]

const STEPS: Step[] = [
  { 
    number: "01", 
    title: "ask", 
    description: "type any question about your campus in plain english." 
  },
  { 
    number: "02", 
    title: "understand", 
    description: "our ai processes your question and searches campus data sources." 
  },
  { 
    number: "03", 
    title: "answer", 
    description: "get an instant, accurate response with real-time information." 
  },
]

const STATS: Stat[] = [
  { value: "3,200+", label: "students on waitlist" },
  { value: "10,000", label: "students at pilot campus" },
  { value: "3+ hrs", label: "saved daily per student" },
]

const THINKING_ABOUT: ThinkingAboutItem[] = [
  {
    title: "embodied ai",
    description: "attention modeling for manipulation tasks. spatial reasoning, occlusion handling, contact dynamics. closing the gap between perception and control in robotics."
  },
  {
    title: "physical labor data",
    description: "a creator economy for trades. electricians, plumbers, machinists producing valuable training data every day—what if they got paid for it? outcome as a service."
  },
]

function WaitlistForm({ variant = 'default' }: { variant?: 'default' | 'compact' | 'cta' }) {
  const [email, setEmail] = useState('')
  const [status, setStatus] = useState<'idle' | 'loading' | 'success' | 'error'>('idle')

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault()
    if (!email) return

    setStatus('loading')

    try {
      const response = await fetch(FORMSPREE_URL, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email }),
      })

      if (response.ok) {
        setStatus('success')
        setEmail('')
      } else {
        setStatus('error')
      }
    } catch {
      setStatus('error')
    }
  }

  if (status === 'success') {
    return (
      <div className={`text-center ${variant === 'cta' ? 'text-brown-900' : ''}`}>
        <p className="text-lg font-medium">you're on the list!</p>
        <p className={`text-sm ${variant === 'cta' ? 'text-brown-600' : 'text-brown-500'}`}>
          we'll reach out when toki launches at your campus.
        </p>
      </div>
    )
  }

  if (variant === 'compact') {
    return (
      <form onSubmit={handleSubmit} className="flex gap-2">
        <input
          type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          placeholder="your@email.edu"
          required
          className="px-4 py-2 rounded-full bg-cream border border-brown-200 text-brown-900 placeholder-brown-400 focus:outline-none focus:ring-2 focus:ring-brown-400"
        />
        <button
          type="submit"
          disabled={status === 'loading'}
          className="px-5 py-2 bg-brown-900 text-cream rounded-full hover:bg-brown-800 transition-colors disabled:opacity-50"
        >
          {status === 'loading' ? '...' : 'join'}
        </button>
      </form>
    )
  }

  return (
    <form onSubmit={handleSubmit} className="flex flex-col sm:flex-row items-center justify-center gap-3">
      <input
        type="email"
        value={email}
        onChange={(e) => setEmail(e.target.value)}
        placeholder="your@email.edu"
        required
        className={`w-full sm:w-auto px-6 py-4 rounded-full border text-lg focus:outline-none focus:ring-2 ${
          variant === 'cta' 
            ? 'bg-white border-brown-200 text-brown-900 placeholder-brown-400 focus:ring-brown-400'
            : 'bg-cream border-brown-200 text-brown-900 placeholder-brown-400 focus:ring-brown-400'
        }`}
      />
      <button
        type="submit"
        disabled={status === 'loading'}
        className="w-full sm:w-auto px-8 py-4 bg-brown-900 text-cream text-lg rounded-full hover:bg-brown-800 transition-colors disabled:opacity-50"
      >
        {status === 'loading' ? 'joining...' : 'join the waitlist'}
      </button>
      {status === 'error' && (
        <p className="text-red-500 text-sm">something went wrong. try again.</p>
      )}
    </form>
  )
}

function Navbar() {
  return (
    <nav className="fixed top-0 left-0 right-0 z-50 bg-cream/80 backdrop-blur-sm border-b border-brown-200/50">
      <div className="max-w-6xl mx-auto px-6 py-4 flex items-center justify-between">
        <a href="/" className="text-2xl font-semibold text-brown-900">toki</a>
        <div className="hidden md:flex items-center gap-8">
          <a href="#features" className="text-brown-700 hover:text-brown-900 transition-colors">
            features
          </a>
          <a href="#how" className="text-brown-700 hover:text-brown-900 transition-colors">
            how it works
          </a>
          <a href="#thinking" className="text-brown-700 hover:text-brown-900 transition-colors">
            thinking about
          </a>
          <a 
            href="#waitlist"
            className="px-5 py-2 bg-brown-900 text-cream rounded-full hover:bg-brown-800 transition-colors"
          >
            join waitlist
          </a>
        </div>
      </div>
    </nav>
  )
}

function Hero() {
  return (
    <section className="pt-32 pb-20 px-6">
      <div className="max-w-4xl mx-auto text-center">
        <h1 className="text-5xl md:text-7xl font-semibold text-brown-900 leading-tight mb-6">
          your campus,<br />answered.
        </h1>
        <p className="text-xl md:text-2xl text-brown-600 max-w-2xl mx-auto mb-10">
          one app where you ask anything about your campus and get instant, accurate answers.
        </p>
        <WaitlistForm />
        <p className="mt-4 text-brown-500">3,200+ students waiting</p>
      </div>
    </section>
  )
}

function DemoQuestions() {
  return (
    <section className="py-16 px-6 bg-brown-100/50">
      <div className="max-w-4xl mx-auto">
        <div className="grid md:grid-cols-2 gap-4">
          {DEMO_QUESTIONS.map((question) => (
            <div 
              key={question}
              className="p-5 bg-cream rounded-2xl border border-brown-200/50 text-brown-700"
            >
              "{question}"
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}

function FeatureCard({ feature }: { feature: Feature }) {
  return (
    <div className="text-center">
      <div className="text-4xl mb-4" role="img" aria-label={feature.title}>
        {feature.icon}
      </div>
      <h3 className="text-xl font-semibold text-brown-900 mb-2">{feature.title}</h3>
      <p className="text-brown-600">{feature.description}</p>
    </div>
  )
}

function Features() {
  return (
    <section id="features" className="py-24 px-6">
      <div className="max-w-5xl mx-auto">
        <h2 className="text-3xl md:text-4xl font-semibold text-brown-900 text-center mb-16">
          everything you need to know, instantly
        </h2>
        <div className="grid md:grid-cols-3 gap-8">
          {FEATURES.map((feature) => (
            <FeatureCard key={feature.title} feature={feature} />
          ))}
        </div>
      </div>
    </section>
  )
}

function StepItem({ step }: { step: Step }) {
  return (
    <div className="flex items-start gap-6">
      <span className="text-brown-400 text-sm font-mono">{step.number}</span>
      <div>
        <h3 className="text-2xl font-semibold mb-2">{step.title}</h3>
        <p className="text-brown-300">{step.description}</p>
      </div>
    </div>
  )
}

function HowItWorks() {
  return (
    <section id="how" className="py-24 px-6 bg-brown-900 text-cream">
      <div className="max-w-4xl mx-auto">
        <h2 className="text-3xl md:text-4xl font-semibold text-center mb-16">
          how it works
        </h2>
        <div className="space-y-12">
          {STEPS.map((step) => (
            <StepItem key={step.number} step={step} />
          ))}
        </div>
      </div>
    </section>
  )
}

function Stats() {
  return (
    <section className="py-24 px-6">
      <div className="max-w-4xl mx-auto">
        <div className="grid md:grid-cols-3 gap-8 text-center">
          {STATS.map((stat) => (
            <div key={stat.label}>
              <div className="text-5xl font-semibold text-brown-900 mb-2">{stat.value}</div>
              <div className="text-brown-600">{stat.label}</div>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}

function ThinkingAboutCard({ item }: { item: ThinkingAboutItem }) {
  return (
    <div className="p-8 bg-cream rounded-2xl border border-brown-200/50">
      <h3 className="text-2xl font-semibold text-brown-900 mb-4">{item.title}</h3>
      <p className="text-brown-600 leading-relaxed">{item.description}</p>
    </div>
  )
}

function ThinkingAbout() {
  return (
    <section id="thinking" className="py-24 px-6 bg-brown-100/50">
      <div className="max-w-4xl mx-auto">
        <h2 className="text-3xl md:text-4xl font-semibold text-brown-900 text-center mb-6">
          thinking about
        </h2>
        <p className="text-center text-brown-600 mb-16 max-w-2xl mx-auto">
          beyond toki, here's what i'm exploring.
        </p>
        <div className="grid md:grid-cols-2 gap-6">
          {THINKING_ABOUT.map((item) => (
            <ThinkingAboutCard key={item.title} item={item} />
          ))}
        </div>
      </div>
    </section>
  )
}

function CallToAction() {
  return (
    <section id="waitlist" className="py-24 px-6">
      <div className="max-w-3xl mx-auto text-center">
        <h2 className="text-3xl md:text-4xl font-semibold text-brown-900 mb-6">
          stop searching. start asking.
        </h2>
        <p className="text-xl text-brown-600 mb-10">
          join thousands of students waiting for a better way to navigate campus life.
        </p>
        <WaitlistForm variant="cta" />
      </div>
    </section>
  )
}

function Footer() {
  const currentYear = new Date().getFullYear()
  
  return (
    <footer className="py-12 px-6 border-t border-brown-200/50">
      <div className="max-w-6xl mx-auto flex flex-col md:flex-row items-center justify-between gap-6">
        <div className="text-brown-900 font-semibold text-xl">toki</div>
        <div className="flex items-center gap-6 text-brown-600 text-sm">
          <a 
            href="mailto:ayomideadekoya266@gmail.com" 
            className="hover:text-brown-900 transition-colors"
          >
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
          © {currentYear} toki
        </div>
      </div>
    </footer>
  )
}

function App() {
  return (
    <div className="min-h-screen bg-cream">
      <Navbar />
      <main>
        <Hero />
        <DemoQuestions />
        <Features />
        <HowItWorks />
        <Stats />
        <ThinkingAbout />
        <CallToAction />
      </main>
      <Footer />
    </div>
  )
}

export default App
