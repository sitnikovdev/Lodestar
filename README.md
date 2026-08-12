# Lodestar

**Talk to your Garmin data.**

Lodestar is an iOS app that turns your Garmin wearable data into a
dashboard you can glance at and a chat you can actually reason with — one
that answers from your real numbers instead of guessing.

## Why

Most "AI + wearable" demos hand the model a raw data dump and hope for a
grounded answer. Lodestar doesn't. It computes deterministic metrics first,
distills only what's relevant into a compact evidence object, and only then
lets the model respond. The model never sees your full history — it sees
exactly the evidence it needs to answer *this* question.

## Architecture

```
Garmin
  │
  ▼
Raw Data              (Garmin Connect data via Open Wearables)
  │
  ▼
Domain Model           (typed Swift models: Sleep, HRV, Body Battery, RHR, Training Load)
  │
  ▼
Analytics Engine        (deterministic scores, baselines, week-over-week trends)
  │
  ▼
Evidence                (compact, question-scoped structured context)
  │
  ▼
LLM Context              (evidence + user question → prompt)
  │
  ▼
AI
  │
  ▼
Answer
```

Every layer has a single job:

| Layer | Responsibility |
|---|---|
| **Raw Data** | Normalized Garmin data (sleep, HRV, Body Battery, stress, RHR) via a self-hosted [Open Wearables](https://openwearables.io) instance, or a bundled JSON fixture set in demo mode |
| **Domain Model** | Typed, `Codable` Swift models — no dictionaries or loose JSON past this point |
| **Analytics Engine** | Pure, deterministic, unit-tested functions: recovery score, HRV baseline deviation, week-over-week trends |
| **Evidence** | A small, question-scoped JSON object built from the analytics output — never the raw dump |
| **LLM Context** | Evidence + the user's question, assembled into a prompt that constrains the model to answer only from what it's given |
| **AI** | Streams a grounded, natural-language answer back into the chat |

## MVP

### Dashboard

At a glance:

- Recovery
- Body Battery
- Sleep
- HRV
- Resting Heart Rate
- Training Load

### Chat

Ask in plain language, grounded in your own data:

- "How did I sleep last night?"
- "Should I train today?"
- "Why is my recovery low?"
- "Compare this week with last week."
- "What affected my HRV?"
- "Analyze my last 30 days."

## Example evidence object

This is what the model actually receives — not your full Garmin history:

```json
{
  "today": {
    "sleep": {
      "duration": 26100,
      "score": 72,
      "deep": 5400,
      "rem": 6300
    },
    "hrv": {
      "average": 48,
      "baseline": 55
    },
    "bodyBattery": 64,
    "restingHeartRate": 52
  }
}
```

## Tech stack

- **Tuist** for project generation and module structure
- **UIKit** for the UI
- **SnapKit** for Auto Layout
- **MVVM** for state management and view-logic separation
- **[Open Wearables](https://openwearables.io)** (open-source, MIT-licensed, self-hosted) as the normalization layer between Garmin Connect and the app — avoids Garmin's official Health API partner-approval process while still going through Garmin's real OAuth flow
- A **demo mode** with bundled JSON fixtures matching the Open Wearables schema, so the app runs fully offline without a connected Garmin account

## Data mode

Lodestar can run in two modes, switchable from onboarding/Settings:

- **Real mode** — connects to a self-hosted Open Wearables instance, which handles Garmin's OAuth 1.0a flow and push-notification callbacks, and exposes normalized JSON.
- **Demo mode** — uses local JSON fixtures in the same schema, covering a range of scenarios (low recovery, missed sleep, rising HRV) for reliable, network-independent demos.

## Privacy

Lodestar only ever sends the model a small, question-scoped evidence object
— never raw Garmin data. Connecting a real account requires explicit
consent during onboarding. Chat responses are not medical advice.

## Project status

Built in public, tracked via GitHub Issues and Milestones:

- **M0** — Project infrastructure (Tuist, Swift 6, UIKit, SnapKit, MVVM)
- **M1** — Data layer & domain model
- **M2** — Analytics engine & evidence
- **M3** — Dashboard
- **M4** — AI chat
- **M5** — Polish & release

## License

TBD.
