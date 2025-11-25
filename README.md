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

- ios: swift, swiftui
- backend: fastapi, weaviate
- inference: llama 3.1 (local) + gpt-4 fallback

## status

pilot at howard university. 3,200+ waitlist.

## structure

```
Toki/
├── App/
│   └── TokiApp.swift
├── Views/
│   ├── ChatView.swift
│   ├── ExploreView.swift
│   ├── DiningView.swift
│   ├── LibraryView.swift
│   ├── ShuttleView.swift
│   └── ...
├── Models/
│   ├── Message.swift
│   ├── Campus.swift
│   └── ...
├── Services/
│   ├── APIService.swift
│   ├── AuthService.swift
│   └── ...
└── ViewModels/
    └── ChatViewModel.swift
```

## roadmap

- [ ] siri shortcuts
- [ ] apple watch app
- [ ] android version
