# toki

ai answer engine for campus life.

## what

one app where students ask anything about their campus and get instant answers.

- "is the library busy?"
- "what's for lunch?"
- "how do i appeal a grade?"
- "when does the shuttle come?"

## features

- natural language q&a
- real-time occupancy data
- smart alerts
- dining menus
- shuttle tracking
- event discovery

## stack

**ios app:**
- swift 5.9+
- swiftui
- async/await
- combine

**backend:**
- fastapi
- weaviate (vector db)
- llama 3.1 (local inference)
- gpt-4 (fallback)

## structure

```
Toki/
├── App/
│   ├── TokiApp.swift
│   └── DeepLinkHandler.swift
├── Views/
│   ├── ChatView.swift
│   ├── ExploreView.swift
│   ├── AlertsView.swift
│   ├── SettingsView.swift
│   ├── SignInView.swift
│   └── ContentView.swift
├── ViewModels/
│   └── ChatViewModel.swift
├── Models/
│   ├── Message.swift
│   ├── Campus.swift
│   ├── Event.swift
│   ├── Alert.swift
│   ├── QuickAction.swift
│   ├── SearchHistory.swift
│   └── AppError.swift
├── Services/
│   ├── APIService.swift
│   └── AuthService.swift
└── Extensions/
    ├── Date+Formatting.swift
    ├── String+Extensions.swift
    └── View+Keyboard.swift
```

## web

landing page in `/web`. deploy to vercel.

```bash
cd web
pnpm install
pnpm dev
```

## status

pilot at howard university. 3,200+ waitlist.

## license

mit
