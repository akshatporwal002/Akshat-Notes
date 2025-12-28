# 🧠 Desktop App Concept – Pulse

### ⌘-Space AI Launcher → Privacy-First → Cost-Optimised Personal Assistant

## 🌟 Overview

Pulse is a **desktop AI launcher** that appears instantly via a global shortcut (e.g. ⌘ Space), allowing users to ask questions, generate content, and reason with AI without opening a browser or app.

The app is **privacy-first**, **highly customisable**, and **cost-optimised**, supporting multiple AI providers (ChatGPT API, Gemini API) and advanced context-management techniques to keep usage fast and cheap.

**Goal:** Create the fastest, most private, and most efficient way to interact with AI on desktop.

---

## 🚀 Problem

Current AI usage has several frictions:

- Switching to browser tabs breaks flow
    
- Long chats become slow and expensive
    
- Subscription pricing doesn’t scale with light users
    
- Screen recording captures sensitive AI content
    
- AI tools lack deep UI customisation
    
- Context bloat causes token explosion and rising costs
    

Pulse fixes this by combining:  
**instant access + intelligent memory + aggressive cost control + privacy UI**.

---

## 💡 Solution Summary

Pulse provides a seamless AI workflow:

1. User presses ⌘ Space.
    
2. A lightweight, always-on-top popup appears instantly.
    
3. User types a query.
    
4. The app injects **only minimal required context**.
    
5. AI answers using the optimal model.
    
6. Context is summarized, cached, or expanded **only if needed**.
    
7. UI disappears instantly when dismissed.
    

All while keeping:

- Token usage capped
    
- Sensitive UI hidden from recordings
    
- Full user control over appearance and behaviour
    

---

## 🔧 Key Features

### 1. **Instant Global Launcher**

- Global shortcut (⌘ Space or custom)
    
- Appears above all windows
    
- Zero startup latency
    
- Keyboard-first interaction
    

---

### 2. **Hierarchical Memory System**

Pulse uses **multi-layered context** instead of dumping full chat history:

#### Memory Layers

- **Short Context**: Always injected (tiny rolling summary)
    
- **Extended Summary**: Larger compressed context (not always sent)
    
- **Raw History**: Stored locally, never sent unless needed
    

#### Conditional Context Loading

- The AI first answers using short context
    
- If insufficient, it explicitly requests extended context
    
- The app injects more context only when required
    

This keeps token usage near-constant even in long conversations.

---

### 3. **Free-Tier Summarisation Pipeline**

- Long conversations are summarized using **Gemini API (free tier)**
    
- Summaries replace raw history
    
- New chats start with a distilled summary + recent turns
    

**Result:** 60–80% reduction in token cost for long sessions.

---

### 4. **Model Tiering & Smart Routing**

Different models are used for different tasks:

- **Gemini (free)** → summarisation, compression
    
- **Cheap LLM** → intent detection, routing, context checks
    
- **Strong ChatGPT model** → final reasoning & answers
    

This prevents expensive models from being used unnecessarily.

---

### 5. **Aggressive Cost Controls**

Built-in safeguards:

- Output length caps by default
    
- Token-aware truncation of low-value messages
    
- Cached responses for repeated queries
    
- Hard token budgets with fallback to cheaper models
    
- Optional semantic deduplication for repeated questions
    

Users get high quality answers with predictable cost.

---

## 🪟 UI & Privacy Design

### Invisible to Screen Recording (Privacy Mode)

- Window marked as non-capturable by standard screen recorders
    
- Hidden from screenshots, Zoom, OBS, Loom, etc.
    
- Designed for sensitive work (notes, coding, finance, exams)
    

_(Not guaranteed against hardware or kernel-level capture)_

---

### Transparent & Glass UI

- Fully transparent or frosted glass background
    
- Adjustable opacity
    
- Blur strength control
    
- Optional borderless design
    

---

### Full Customisation

Users can configure:

- Opacity & blur
    
- Font size & font family
    
- Compact vs expanded mode
    
- Light / dark / auto themes
    
- Animation speed
    
- Click-through behaviour
    

All customisation is local and free.

---

## 🔄 Core Flow (Technical)

### Query Flow

1. User submits query
    
2. App injects:
    
    - System prompt
        
    - Short context summary
        
    - Recent turns
        
3. AI decides:
    
    - `ENOUGH_CONTEXT` → answer
        
    - `REQUEST_EXTENDED_CONTEXT` → inject larger summary
        
4. Final answer generated
    
5. Conversation updated
    
6. If token threshold reached → Gemini summarisation triggered
    

---

### Cost-Optimised Lifecycle

- History grows → summarised → replaced
    
- Extended context loaded lazily
    
- Strong models used only when needed
    
- Token usage capped per session
    

---

## 🎯 Target Users

- Developers & engineers
    
- University students
    
- Traders & analysts
    
- Writers & researchers
    
- Power users who live on keyboard shortcuts
    
- Anyone who values privacy + speed
    

---

## 🪙 Monetisation Options

### Option 1: BYO API Key (Primary)

- Users bring their own ChatGPT / Gemini API key
    
- Pulse is free or one-time purchase
    
- Extremely low operating cost
    

### Option 2: Subscription

- Flat monthly price
    
- Token budget included
    
- Premium UI & memory features
    

### Option 3: Hybrid

- Free tier with limits
    
- Paid tier unlocks higher token budgets & advanced memory
    

---

## 📈 Why It Can Succeed

- **Instant access** beats browser-based AI
    
- **Cost efficiency** beats subscriptions for many users
    
- **Privacy mode** is a strong differentiator
    
- **Customisable UI** attracts power users
    
- **Technically feasible MVP** with high perceived value
    
- Desktop-first avoids mobile OS restrictions
    

---

## 🧱 MVP Scope (3–5 Weeks)

- Global shortcut popup
    
- ChatGPT API integration
    
- Gemini summarisation
    
- Short vs extended context logic
    
- Basic transparent UI
    
- Local settings storage
    

---

## 📌 Future Enhancements

- Clipboard-aware queries
    
- App-aware context (opt-in)
    
- Plugin / tool system
    
- Voice input
    
- Multi-window AI sessions
    
- Local embeddings for long-term memory
    

---

## ⚡ Vision

Become the **default AI interaction layer for desktop**.

A fast, private, cost-efficient assistant that feels like part of the operating system — not another app.

---