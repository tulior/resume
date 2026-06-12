// ─────────────────────────────────────────────────────────────
// Build:  typst compile resume.typ out.pdf --input paper=a4
//         typst compile resume.typ out.pdf --input paper=letter
// ─────────────────────────────────────────────────────────────
#let paper-input = sys.inputs.at("paper", default: "a4")
#let page-paper = if paper-input == "letter" { "us-letter" } else { "a4" }

// ── Theme ──
#let accent = rgb("#184f78")
#let muted = rgb("#4f5b66")
#let rule-color = rgb("#c4cbd3")
#let ink = rgb("#1d2329")

// ── Spacing scale: tune density in one place ──
#let sp = (
  section-above: 0.9em,
  section-below: 0.28em,
  job-above: 0.6em,
  client-above: 0.38em,
  bullet-gap: 0.18em,
)

#set document(
  title: "Tulio Ribeiro dos Anjos Resume",
  author: "Tulio Ribeiro dos Anjos",
  keywords: ("Senior Software Engineer", ".NET", "C#", "Full-Stack"),
  // Reproducible output: PDF bytes only change when content changes,
  // which keeps the CI auto-commit from producing noise commits.
  date: none,
)
#set page(
  paper: page-paper,
  margin: (x: 0.5in, y: 0.45in),
  footer: context {
    let total = counter(page).final().first()
    let current = counter(page).get().first()
    // Continuation pages identify themselves if printed/separated.
    if total > 1 and current > 1 {
      set text(size: 7.5pt, fill: muted)
      grid(
        columns: (1fr, auto),
        [Tulio Anjos],
        [Page #current of #total],
      )
    }
  },
)
#set text(lang: "en", font: "Libertinus Serif", size: 9.2pt, fill: ink)
#set par(justify: false, leading: 0.43em, spacing: 0.42em)
#set list(marker: [•], tight: true, spacing: sp.bullet-gap, indent: 1.1em, body-indent: 0.42em)

#show link: set text(fill: accent)
#show raw: set text(size: 0.92em)

#let divider() = line(length: 100%, stroke: (paint: rule-color, thickness: 0.45pt))

// Real headings: PDF gets a navigable outline + semantic structure (ATS-friendlier).
// sticky: a heading can never be orphaned at the bottom of a page.
#show heading.where(level: 1): it => block(sticky: true, above: sp.section-above, below: sp.section-below)[
  #text(size: 8pt, weight: "bold", fill: accent, tracking: 0.55pt)[#it.body]
  #v(0.08em)
  #divider()
]
#show heading.where(level: 2): it => text(size: 9.2pt, weight: "bold")[#it.body]
#show heading.where(level: 3): it => text(size: 9.2pt, weight: "bold", fill: accent)[#it.body]

#let job-header(company, location, role, dates, summary: none) = block(sticky: true, above: sp.job-above, below: 0.12em)[
  // Dates pinned to the right edge: tenure is scannable in one vertical pass.
  #grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    [#heading(level: 2, company) #text(fill: muted)[| #location]],
    align(right)[#emph(dates)],
  )
  #strong(role)
  #if summary != none [
    #linebreak()
    #text(fill: muted, style: "italic")[#summary]
  ]
]

#let client-header(name) = block(sticky: true, above: sp.client-above, below: 0.08em)[
  #heading(level: 3)[Client: #name]
]

// ── Header ──
#align(center)[
  #text(size: 18pt, weight: "bold")[Tulio Anjos]
  #v(0.08em)
  #text(size: 10.5pt, weight: "bold")[Senior Software Engineer (.NET · Full-Stack)]
  #v(0.12em)
  Campo Grande, Brazil (UTC-4) | Works US hours remotely
  #linebreak()
  #link("mailto:mail@tulio.org")[mail\@tulio.org] | #link("tel:+5567992660804")[+55 67 9 9266 0804 (WhatsApp)] | #link("https://linkedin.com/in/tulioanjos")[linkedin.com/in/tulioanjos]
]

#v(0.24em)
#divider()
#v(0.26em)

// ── Summary ──
12 years shipping software across the stack. Mostly .NET backend, plenty of Angular and React. Recently building LLM-powered voice ordering features for restaurants: tool-calling agents, Twilio Conversation Relay, live menu snapshotting, prompt serialization, and post-call observability. Before that: fleet telematics processing 150M+ daily events, retail POS with Shopify integration and 100K+ SKUs, and state audit systems spanning 79 municipalities, each with their own schema.

I read unfamiliar codebases in hours, not days. I ask why before I build. Sometimes I fix things nobody asked me to fix because messy code bothers me.

Based in Brazil, working US hours since 2022. English C2. B2B via Deel or direct contract.

Looking for a product company where I can own something end-to-end. Open to staff augmentation. I'm good at it.

#v(0.2em)
// Label/value grid: wrapped lines align under the value column, not the label.
#grid(
  columns: (auto, 1fr),
  column-gutter: 0.5em,
  row-gutter: 0.28em,
  strong[Core stack:], [C\#, .NET 8, ASP.NET Core, Entity Framework Core, SQL Server, PostgreSQL],
  strong[Also worked with:], [AWS (Lambda, SQS), Azure (Event Hubs, Entra), RabbitMQ, Google BigQuery, Angular, React, Blazor Server, Docker, Kubernetes, Twilio ConversationRelay, Microsoft.Extensions.AI, Quartz, Aspire, OpenTelemetry, Serilog, Datadog],
)

= PROFESSIONAL EXPERIENCE

#job-header(
[VELOZIENT],
[Remote],
[Senior Software Engineer (Contractor)],
[Apr 2026 – Present],
summary: [Embedded with HungerRush on OrderAI, an LLM-powered voice ordering platform for restaurants. 19 merged PRs in the first six weeks, net-negative diff.],
)

* Retired the legacy Vapi and ConversationEngine call paths, making Twilio ConversationRelay the sole telephony path. Staged the rollout: purged provider code and the TypeScript workspace, removed config/admin/infra wiring, then dropped the dead database columns. One call path instead of three, ~15K lines deleted.
* Fixed the order-submission money path: atomic submission claiming to stop duplicate POS orders on retries, fresh DbContext persistence for the long-running submit flow, and retries for terminal call-status writes that were silently dropped when requests got cancelled.
* Implemented live menu snapshotting for HOLO-enabled stores. On order start, OrderAI fetches the current HOLO menu, stores it as a deterministically fingerprinted snapshot, and links the order to the exact menu used during the call. If the live fetch fails, the caller is transferred instead of being served stale menu data.
* Built LLM-generated post-call QA summaries for ended calls, including structured review output for call resolution, ordering outcome, escalation reason, customer experience, and follow-up signals surfaced directly in Teams.
* Built the Teams alerting pipeline for ended calls: non-blocking webhook posting, suppression rules, Adaptive Card summaries with admin deep links, and centralized CR/CE ending paths so WebSocket closes, Twilio callbacks, and abandoned-call cleanup produce exactly one alert.
* Added strict enum-backed terminal reasons to the `end_call` and `escalate_call` tools, so the live agent reports a structured reason every time it ends or transfers a call instead of an opaque hangup.
* Tightened production observability: structured call-routing decision logs, Npgsql driver telemetry, Datadog field-collision fixes, and explicit log signals for duplicate-submission and menu-transfer alerts. Traced ~4,900 warn logs/day — 98% of all service warnings — to expected Twilio info frames and wrote the fix.
* Also shipped POS order-type resolution from menu data, store-hours call handling, eval suite JSON import/export, PostgreSQL Entra token refresh, OIDC redirect host fixes, and production call-failure fixes from transcript/cart/tool-call analysis.

#job-header(
  [BAIRESDEV],
  [Remote],
  [Senior Software Engineer (Contractor)],
  [Jun 2022 – Nov 2025],
  summary: [Staff augmentation - embedded with US enterprise clients on three different products.],
)

#client-header([Fleet Telematics Platform])
- Worked on backend and frontend for a fleet management system processing 150M+ vehicle telemetry signals per day. Implemented features, fixed bugs, handled tickets across the stack.
- Built driver assignment and trip segmentation feature. Read telemetry data to determine which driver was logged into each vehicle during trips, then split trips when drivers changed mid-route so each driver got their own performance metrics. Worked out the logic myself, dealt with messy data.
- Built shift metrics system. Created Angular frontend for CSV upload of route shifts, then built the backend service that runs every 5 minutes to compute fuel consumption, safety scores, distance, and speed by reading from the raw telemetry table. Took 2-3 weeks.
- Refactored a slow aggregation service. Changed it from single-record inserts to batch processing with BigQuery MERGE statements. Cut runtime from 60 minutes to 30 seconds and fixed a data duplication bug in the process. Later discovered the service was also running in GCP - someone had forgotten to kill it there after we moved to Azure.
- Refactored Angular 17 components from observables to signals for better readability and maintainability. Nobody asked me to, but I saw the code was messy and fixed it.
- Worked with RabbitMQ and MassTransit for async event processing. Maintained Helm charts (mostly adding environment variables).

#client-header([Retail POS & Inventory Platform])
- Primary engineer on Shopify integration. Built the microservice to allow retailers to sell through Shopify as a new sales channel instead of the legacy POS. Used Lambda and SQS to let old microservices communicate with the new integration service.
- Handled bi-directional sync: POS was source of truth for inventory updates to Shopify. Captured Shopify webhooks to process payments and keep inventory in sync when items sold through Shopify.
- Worked around Shopify's 100-variant limit by implementing custom catalog-splitting logic to sync against a master catalog of 100K+ items.
- Built a serverless image collage generator on AWS Lambda. Wrote custom edge-detection logic for context-aware cropping because OpenCV doesn't work well in the Lambda environment.
- Developed an internal image processing library using SkiaSharp to replace a costly third-party tool. Packaged it as a NuGet artifact that other backend teams adopted.
- Maintained Terraform configs and created Azure DevOps YAML pipelines for CI/CD and deployment.

#client-header([GDPR/CCPA Compliance Platform])
- Migrated legacy data access layer to modern RESTful patterns. Refactored queries to eliminate SQL injection risks and make frontend integration cleaner.

#job-header(
  [GRUPO IMAGETECH],
  [Campo Grande, Brazil],
  [Software Engineer],
  [Aug 2019 – Jun 2022],
  summary: [Embedded with the State Audit Court (TCE-MS) to modernize their audit infrastructure.],
)
- Built a Java-based ETL tool with a CLI that municipalities could run locally to extract financial data from their legacy databases. The CLI connected to their DBs and ran Kettle scripts to extract the data. 79 different municipalities, each with their own schema. Data loaded into central MongoDB repository for automated audits.
- Used GZIP compression and retry logic to handle unreliable connections and low bandwidth in remote areas.
- Built a new Angular app from scratch by migrating it from legacy JSF. About 10 forms/screens, took one month.
- Developed additional Angular components for the state-wide fiscal submission portal (micro-frontend architecture).
- Containerized legacy applications with Docker and set up GitLab CI/CD pipelines.

#job-header(
  [FONTE TECNOLOGIA],
  [Campo Grande, Brazil],
  [Software Engineer],
  [Aug 2017 – Aug 2019],
  summary: [Embedded with State Secretariat of Justice & Public Safety (SEJUSP) for mission-critical dispatch systems.],
)
- Maintained the ASP.NET Web API backend for the Computer-Aided Dispatch system used by Military Police. Worked on real-time SignalR communication for incident updates and patrol coordination.
- Contributed to the Knockout.js frontend for the dispatch interface.
- Built features for the Integrated Operational Management System (PHP/Backbone.js) - the central database for statewide police incident reports.

#job-header(
  [PSG TECNOLOGIA],
  [Campo Grande, Brazil],
  [Software Engineer],
  [Mar 2013 – Aug 2017],
  summary: [Embedded with State Secretariat of Finance (SEFAZ-MS) to build fiscal planning systems.],
)
- Built the state's Planning & Finance System, including a legislative drafting engine that modeled complex legal hierarchies using recursive SQL queries. Used SQL Server, jQuery, and Bootstrap for the full-stack implementation.
- Supported multi-year budget planning workflows and reporting.

= EDUCATION & CERTIFICATIONS

- #strong[Bachelor of Engineering – Computer Engineering] | Uniderp (2013)
- #strong[Oracle Certified Professional: Java SE 11 Developer] | (2021)
- #strong[English:] EF SET C2 Proficient (79/100)