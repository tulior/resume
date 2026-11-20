// ─────────────────────────────────────────────────────────────
// Build: typst compile --ignore-system-fonts --font-path fonts resume.typ out.pdf
// ─────────────────────────────────────────────────────────────

#set document(
  title: "Tulio Ribeiro dos Anjos Resume",
  author: "Tulio Ribeiro dos Anjos",
  keywords: ("Senior Software Engineer", ".NET", "C#", "Full-Stack"),
  // Reproducible output: PDF bytes only change when content changes,
  // which keeps the CI auto-commit from producing noise commits.
  date: none,
)
#set page(
  paper: "a4",
  margin: (x: 0.6in, y: 0.55in),
  fill: white,
)
#set text(lang: "en", font: "Source Sans 3", size: 10.1pt, fill: black, spacing: 115%)
#set par(justify: false, leading: 5.7pt, spacing: 8pt)
#set list(marker: [•], tight: true, spacing: 8.1pt, indent: 0pt, body-indent: 6.5pt)

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

#let employer-line(label, dates) = grid(
  columns: (1fr, auto),
  column-gutter: 12pt,
  align: (left + horizon, right + horizon),
  label,
  text(size: 9.6pt, fill: luma(62), dates),
)

#let job-header(company, location, role, dates, summary: none) = block(sticky: true, above: 14pt, below: 6pt)[
  #employer-line([
    #text(size: 12.6pt)[#heading(level: 2, company)]#h(4.5pt)| #location
  ], dates)
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
      spacing: 4pt,
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
    #link("mailto:mail@tulio.org")[mail\@tulio.org], #link("tel:+5567992660804")[+55 67 99266-0804 (WhatsApp)], #link("https://linkedin.com/in/tulioanjos")[LinkedIn]
  ]
]

// ── Summary ──
I’m an experienced software developer with *13 years of experience*. At HungerRush, I develop production LLM voice agents with tool calls that check live menu availability and send orders to restaurant POS systems.

= Professional experience

#job-header(
  [Velozient],
  [Remote],
  [Senior Software Engineer (Contractor)],
  [Apr 2026 – Present],
  summary: [Embedded with *HungerRush on OrderAI* (Azure OpenAI, Twilio).],
)

- Created a versioned menu normalization for speech: pinned menus with POS IDs/prices/availability.
- Created a PostgreSQL submission claim and individual EF Core context per POS submission to avoid disposed context failures (in concurrency tests, overlapping retries resulted in 1 POS request).
- Created SMS prepayment for phone orders: payment callbacks with saved checkout state to finalize the order and text the user a confirmation. Co-developed payment tool selection based on caller intent.
- Trimmed JSONB reads causing OOM restarts (*93% less allocations*, from 2.15 MB to 151 KB in local WebSocket replay). Fixed a static schema cache leak (*186 to 0 retained tool chains* in local heap profiles).
- Created LLM post-call reviews with Blazor Admin evidence views. Co-developed a reviewer that confirms the agent’s claims vs. computed cart facts.
- Turned Twilio ConversationRelay into the sole voice path, eliminating *about 13,000 lines* of legacy Vapi code and config. Retried final call status writes after request cancellation.
- Turn latency tracing with OpenTelemetry. Restored Azure Container Apps voice capacity with Terraform.

#job-header(
  [BairesDev],
  [Remote],
  [Senior Software Engineer (Contractor)],
  [Jun 2022 – Nov 2025],
  summary: [Staff augmentation for U.S. enterprise clients.],
)

#client-project([Fleet telematics (150M+ vehicle signals/day)])[
  - Batched BigQuery MERGE writes to fix duplicates, reducing execution time from 60 minutes to *30 seconds*.
  - Created driver trip segmentation with login telemetry to calculate per-driver metrics.
  - Developed an Angular CSV upload for route shifts and a backend job to compute #box[fuel use/safety scores/distance/speed] from raw telemetry every 5 minutes.
]

#client-project([Retail POS/inventory])[
  - Primary engineer on the Shopify integration, connecting the legacy POS with AWS Lambda/SQS. Divided the #box[*100K+ item catalog*] to stay within Shopify’s 100-variant limit.
  - Synchronized POS stock with Shopify. Used Shopify webhooks to process payments and synchronize stock #box[post-sales].
  - Wrote edge detection for collage cropping in Lambda to avoid packaging OpenCV.
  - Replaced a costly third-party tool with a SkiaSharp NuGet package adopted by other teams.
]

= Earlier software engineering experience

#earlier-job(
  [Grupo Imagetech],
  [Aug 2019 – Jun 2022],
  [Developed Java/Kettle ETL for state audits across 79 municipalities. Added Docker/GitLab CI/CD to legacy apps.],
)

#earlier-job(
  [Fonte Tecnologia],
  [Aug 2017 – Aug 2019],
  [Maintained the Military Police dispatch API in ASP.NET, including SignalR incident/patrol updates.],
)

#earlier-job(
  [PSG Tecnologia],
  [Mar 2013 – Aug 2017],
  [Developed a state finance system, including a legislative drafting module with recursive SQL Server queries.],
)

= Education & certifications

B.Eng. in Computer Engineering · Uniderp (2013)
#linebreak()
Oracle Certified Professional: Java SE 11 Developer (2021), EF SET English C2 Proficient

#block(above: 10pt, breakable: false, width: 100%, inset: (top: 5pt), stroke: (top: 0.5pt + luma(145)))[
  #set text(size: 9.6pt)
  #grid(
    columns: (auto, 1fr),
    column-gutter: 12pt,
    row-gutter: 3.7pt,
    strong[Application], [C\# 14, .NET 10, ASP.NET Core, EF Core, SignalR, Blazor, Angular, Java],
    strong[Data], [PostgreSQL, SQL Server, BigQuery],
    strong[AI/voice], [Azure OpenAI, Twilio ConversationRelay, LLM tool calling/evaluation],
    strong[Cloud/ops], [Azure Container Apps, AWS Lambda, SQS, Docker, Terraform, OpenTelemetry],
  )
]
