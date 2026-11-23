// ─────────────────────────────────────────────────────────────
// Build: typst compile --ignore-system-fonts --font-path fonts resume.typ Tulio-Anjos-Resume.pdf
// ─────────────────────────────────────────────────────────────

#set document(
  title: "Tulio Anjos - Resume",
  author: "Tulio Anjos",
  keywords: ("Senior Software Engineer", ".NET", "C#", "Full-Stack"),
  // Omit the document date for reproducible builds with the pinned compiler and fonts.
  date: none,
)
#set page(
  paper: "a4",
  margin: (x: 0.6in, y: 0.55in),
  fill: white,
)
#set text(lang: "en", font: "Source Sans 3", size: 10.1pt, fill: black, spacing: 115%)
#set par(justify: false, leading: 5.7pt, spacing: 8pt)
#set list(marker: [•], tight: true, spacing: 7.3pt, indent: 0pt, body-indent: 6.5pt)

#set strong(delta: 200)

#show link: underline

#show heading.where(level: 1): it => block(
  sticky: true,
  width: 100%,
  above: 13pt,
  below: 6pt,
  inset: (bottom: 3pt),
  stroke: (bottom: 0.5pt + luma(145)),
  text(size: 11.4pt, weight: "bold", it.body),
)
#show heading.where(level: 2): it => text(weight: "semibold", it.body)
#show heading.where(level: 3): it => text(weight: "semibold", it.body)

#let employer-line(label, dates) = [
  #label#h(12pt)#text(size: 9.6pt, fill: luma(62), dates)
]

#let job-header(company, location, role, dates, summary: none) = block(sticky: true, above: 14pt, below: 6pt)[
  #employer-line([
    #text(size: 12.6pt)[#heading(level: 2, company)]#h(4.5pt)| #location
  ], dates)
  #linebreak()
  #role
  #if summary != none [
    #linebreak()
    #summary
  ]
]

#let client-project(name, accomplishments) = block(above: 10pt, below: 4pt, inset: (left: 7pt))[
  #block(sticky: true, below: 4pt, heading(level: 3)[#name])
  #accomplishments
]

#let earlier-job(company, dates, contribution) = block(above: 8pt, breakable: false)[
  #employer-line(heading(level: 2, company), dates)
  #linebreak()
  #contribution
]

// ── Header ──
#block(below: 12pt)[
  #grid(
    columns: (1fr, auto),
    column-gutter: 20pt,
    align: bottom,
    stack(
      dir: ttb,
      spacing: 8pt,
      text(size: 22.75pt, weight: "bold")[Tulio Anjos],
      text(size: 14.85pt, weight: "bold")[Senior Full-Stack .NET Engineer],
    ),
    block(
      inset: (left: 9pt, top: 1pt, bottom: 1pt),
      stroke: (left: 0.65pt + luma(145)),
      text(size: 10.65pt)[
        Brazil (UTC-4), *U.S. hours since 2022*
        #linebreak()
        *C2 English*, *B2B* via Deel/direct contract
      ],
    ),
  )
  #v(4pt)
  #text(size: 9.6pt)[
    #link("mailto:mail@tulio.org")[mail\@tulio.org],
    #link("https://wa.me/5567992660804")[+55 67 99266-0804 (WhatsApp)],
    #link("https://www.linkedin.com/in/tulioanjos/")[linkedin.com/in/tulioanjos],
    #link("https://github.com/tulior")[github.com/tulior],
    #link("https://tulio.org/")[tulio.org]
  ]
]

// ── Summary ──
*13-year shipping record.* At HungerRush, I'm building production LLM voice agents with tool calls to check live menu availability and submit orders to restaurant POS systems.

= Professional experience

#job-header(
  [Velozient],
  [Remote],
  [Senior Software Engineer (Contractor)],
  [Apr 2026 – Present],
  summary: [Embedded with *HungerRush on OrderAI* (Azure OpenAI, Twilio).],
)

- Shipped versioned speech labels for live menus, pinned each order to its original menu across refreshes, and preserved POS IDs, prices, and availability. Developed Blazor Admin views for saved menu snapshots.
- Cut unused JSONB reads that caused prod OOMs. In local WebSocket replay, typical call-load allocations fell *93%* (#box[2,150 KB to 151 KB]). Resolved a static schema cache leak (*186 to 0 retained tool chains* in local heap profiling).
- Integrated a PostgreSQL claim and a dedicated EF Core context for each POS submission. Fixed disposed-context failures and verified that overlapping retries issued one POS request in concurrency tests.
- Implemented SMS checkout links for phone orders. Payment callbacks use saved checkout state to complete the order and send an SMS confirmation. Co-developed intent-based payment tool selection.
- Implemented LLM post-call reviews and a queued Teams publisher. Co-developed a reviewer to verify agent claims against facts computed from the cart.
- Made Twilio ConversationRelay the sole voice channel, cutting *about 13,000 lines* of legacy Vapi code and config. Retried final call status writes independently of request cancellation.
- Measured latency from prompt to first audio (Twilio events) and traced model calls (OpenTelemetry). Restored configured voice capacity on Azure Container Apps with Terraform.

#job-header(
  [BairesDev],
  [Remote],
  [Senior Software Engineer (Contractor)],
  [Jun 2022 – Nov 2025],
  summary: [Staff augmentation for U.S. enterprise clients.],
)

#client-project([Fleet telematics (150M+ vehicle signals/day)])[
  - Migrated single-row inserts to batched BigQuery MERGEs, fixing duplicates. Cut runtime from 60 min to *30 sec*.
  - Segmented trips using login telemetry to calculate per-driver metrics when drivers changed mid-route.
  - Developed an Angular CSV upload for route shifts and a job to calculate fuel usage/safety scores/distance/speed every 5 min from telemetry.
]

#client-project([Retail POS/inventory])[
  - Primary engineer for the Shopify sales channel. Integrated the legacy POS via AWS Lambda/SQS and split the #box[*100K+ item catalog*] to meet Shopify's 100-variant limit.
  - Synchronized POS inventory to Shopify. Used webhooks to process payments and update POS stock after sales.
  - Implemented edge detection for collage cropping in Lambda instead of packaging OpenCV.
  - Replaced a costly third-party tool with a SkiaSharp NuGet package adopted by other teams.
]

= Previous software engineering experience

#earlier-job(
  [Grupo Imagetech],
  [Aug 2019 – Jun 2022],
  [Developed Java/Kettle ETL for audits across 79 municipal schemas. Dockerized legacy apps and added GitLab CI/CD.],
)

#earlier-job(
  [Fonte Tecnologia],
  [Aug 2017 – Aug 2019],
  [Maintained the ASP.NET Military Police dispatch API, including SignalR incident/patrol updates.],
)

#earlier-job(
  [PSG Tecnologia],
  [Mar 2013 – Aug 2017],
  [Developed a state finance system. Modeled legislative hierarchies using recursive SQL Server queries.],
)

= Education & certifications

B.Eng. in Computer Engineering · Uniderp (2013)
#linebreak()
Oracle Certified Professional: Java SE 11 Developer (2021), EF SET English C2 Proficient

= Technical skills

#block(breakable: false)[
  #set text(size: 9.6pt)
  #set par(leading: 3.7pt)
  *Application*#h(4pt)C\# 14, .NET 10, ASP.NET Core, EF Core, SignalR, Blazor, Angular, Java
  #linebreak()
  *Data*#h(4pt)PostgreSQL, SQL Server, BigQuery
  #linebreak()
  *AI/voice*#h(4pt)Azure OpenAI, Twilio ConversationRelay, LLM tool calling/evaluation
  #linebreak()
  *Cloud/ops*#h(4pt)Azure Container Apps, AWS Lambda, SQS, Docker, Terraform, OpenTelemetry
]
