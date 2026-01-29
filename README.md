# Tulio Anjos
**Senior Software Engineer (.NET · Full-Stack)**  
Campo Grande, Brazil (UTC-4) | Works US hours remotely  
mail@tulio.org | linkedin.com/in/tulioanjos

---

12 years shipping software across the stack. Mostly .NET backend, plenty of Angular and React. US enterprise clients and Brazilian government. Fleet telematics processing 150M+ daily events. Retail POS with Shopify integration and 100K+ SKUs. State audit systems spanning 79 municipalities, each with their own schema.

I read unfamiliar codebases in hours, not days. I ask why before I build. Sometimes I fix things nobody asked me to fix because messy code bothers me.

Based in Brazil, working US hours since 2022. English C2. B2B via Deel or direct contract.

Looking for a product company where I can own something end-to-end. Open to staff augmentation. I'm good at it.

**Core stack:** C#, .NET 8, ASP.NET Core, Entity Framework Core, SQL Server, PostgreSQL  
**Also worked with:** AWS (Lambda, SQS), Azure (Event Hubs), RabbitMQ, Google BigQuery, Angular, Docker, Kubernetes

---

### PROFESSIONAL EXPERIENCE

**BAIRESDEV** | Remote  
**Senior Software Engineer (Contractor)** | *Jun 2022 – Nov 2025*  
*Staff augmentation - embedded with US enterprise clients on three different products.*

**Client: Fleet Telematics Platform**
- Worked on backend and frontend for a fleet management system processing 150M+ vehicle telemetry signals per day. Implemented features, fixed bugs, handled tickets across the stack.
- Built driver assignment and trip segmentation feature. Read telemetry data to determine which driver was logged into each vehicle during trips, then split trips when drivers changed mid-route so each driver got their own performance metrics. Worked out the logic myself, dealt with messy data.
- Built shift metrics system. Created Angular frontend for CSV upload of route shifts, then built the backend service that runs every 5 minutes to compute fuel consumption, safety scores, distance, and speed by reading from the raw telemetry table. Took 2-3 weeks.
- Refactored a slow aggregation service. Changed it from single-record inserts to batch processing with BigQuery MERGE statements. Cut runtime from 60 minutes to 30 seconds and fixed a data duplication bug in the process. Later discovered the service was also running in GCP - someone had forgotten to kill it there after we moved to Azure.
- Refactored Angular 17 components from observables to signals for better readability and maintainability. Nobody asked me to, but I saw the code was messy and fixed it.
- Worked with RabbitMQ and MassTransit for async event processing. Maintained Helm charts (mostly adding environment variables).

**Client: Retail POS & Inventory Platform**
- Primary engineer on Shopify integration. Built the microservice to allow retailers to sell through Shopify as a new sales channel instead of the legacy POS. Used Lambda and SQS to let old microservices communicate with the new integration service.
- Handled bi-directional sync: POS was source of truth for inventory updates to Shopify. Captured Shopify webhooks to process payments and keep inventory in sync when items sold through Shopify.
- Worked around Shopify's 100-variant limit by implementing custom catalog-splitting logic to sync against a master catalog of 100K+ items.
- Built a serverless image collage generator on AWS Lambda. Wrote custom edge-detection logic for context-aware cropping because OpenCV doesn't work well in the Lambda environment.
- Developed an internal image processing library using SkiaSharp to replace a costly third-party tool. Packaged it as a NuGet artifact that other backend teams adopted.
- Maintained Terraform configs and created Azure DevOps YAML pipelines for CI/CD and deployment.

**Client: GDPR/CCPA Compliance Platform**
- Migrated legacy data access layer to modern RESTful patterns. Refactored queries to eliminate SQL injection risks and make frontend integration cleaner.

&nbsp;

**GRUPO IMAGETECH** | Campo Grande, Brazil  
**Software Engineer** | *Aug 2019 – Jun 2022*  
*Embedded with the State Audit Court (TCE-MS) to modernize their audit infrastructure.*

- Built a Java-based ETL tool with a CLI that municipalities could run locally to extract financial data from their legacy databases. The CLI connected to their DBs and ran Kettle scripts to extract the data. 79 different municipalities, each with their own schema. Data loaded into central MongoDB repository for automated audits.
- Used GZIP compression and retry logic to handle unreliable connections and low bandwidth in remote areas.
- Built a new Angular app from scratch by migrating it from legacy JSF. About 10 forms/screens, took one month.
- Developed additional Angular components for the state-wide fiscal submission portal (micro-frontend architecture).
- Containerized legacy applications with Docker and set up GitLab CI/CD pipelines.

&nbsp;

**FONTE TECNOLOGIA** | Campo Grande, Brazil  
**Software Engineer** | *Aug 2017 – Aug 2019*  
*Embedded with State Secretariat of Justice & Public Safety (SEJUSP) for mission-critical dispatch systems.*

- Maintained the ASP.NET Web API backend for the Computer-Aided Dispatch system used by Military Police. Worked on real-time SignalR communication for incident updates and patrol coordination.
- Contributed to the Knockout.js frontend for the dispatch interface.
- Built features for the Integrated Operational Management System (PHP/Backbone.js) - the central database for statewide police incident reports.

&nbsp;

**PSG TECNOLOGIA** | Campo Grande, Brazil  
**Software Engineer** | *Mar 2013 – Aug 2017*  
*Embedded with State Secretariat of Finance (SEFAZ-MS) to build fiscal planning systems.*

- Built the state's Planning & Finance System, including a legislative drafting engine that modeled complex legal hierarchies using recursive SQL queries. Used SQL Server, jQuery, and Bootstrap for the full-stack implementation.
- Supported multi-year budget planning workflows and reporting.

---

### EDUCATION & CERTIFICATIONS
* **Bachelor of Engineering – Computer Engineering** | Uniderp (2013)  
* **Oracle Certified Professional: Java SE 11 Developer** | (2021)  
* **English:** EF SET C2 Proficient (79/100)
