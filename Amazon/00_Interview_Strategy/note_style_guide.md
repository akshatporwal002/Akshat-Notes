# Note Style Guide For Amazon Interview Prep

This guide captures the style we want for the interview preparation documents, inspired by the Week 9 QMD learning notes. The goal is not to create terse cheat sheets. The goal is to create standalone learning documents that explain the concepts clearly enough that Akshat can reason from first principles during the phone screen.

## Core Style

Each document should be written as a narrative, not as a disconnected list of facts. A section should usually begin with a concrete situation, such as:

- A customer uploads 1,000 PDFs into GRADIA.
- A VELEXAR user asks for job recommendations.
- A browser opens a web app behind an AWS load balancer.
- A backend service receives more requests than it can handle synchronously.
- A database query becomes slow as the table grows.

The document should then use that situation to explain the underlying concept. This mirrors the Week 9 notes, where the LMS example becomes the thread for DNS, HTTP, email, media streaming, and sockets.

## Section Pattern

Most major sections should follow this pattern:

1. Jargon check
2. Narrative explanation
3. Architecture or concept diagram when useful
4. Concrete example, preferably tied to AWS or Akshat's resume
5. Trade-offs and common failure modes
6. Section summary
7. Interview check questions, required whenever the topic could plausibly come up in the phone screen

The interview check questions are useful, but they should not replace a real summary. Every section should close with a short explanation of what the section actually taught. If a concept is interview-relevant, the section must also include questions that test whether Akshat can explain it under pressure.

## Jargon Check

Before introducing a dense concept, add a jargon box or list that defines terms in plain English. Definitions should be short and practical.

Good jargon terms to define early include:

- VPC
- subnet
- CIDR block
- NAT
- load balancer
- TLS
- IAM role
- least privilege
- horizontal scaling
- queue
- cache
- eventual consistency
- idempotency
- RDS
- DynamoDB
- vector embedding
- RAG
- latency
- throughput
- availability
- durability

Jargon checks should appear before the section uses the terms heavily, not after the reader is already confused.

## Narrative Requirements

The notes should teach through stories of systems.

For foundation concepts, use a user journey:

- A user types a URL.
- DNS resolves a name.
- The browser creates a TCP/TLS connection.
- The request reaches a load balancer.
- The app server checks auth.
- The database query runs.
- The response is cached or returned.

For resume defense, use project journeys:

- A GRADIA document moves from upload to parsing, chunking, generation, validation, storage, and display.
- A VELEXAR user profile and CV become embeddings, retrieval candidates, ranked matches, and streamed responses.

For AWS concepts, explain the normal concept first, then map it to AWS. For example, explain "private network" before VPC, "identity and permissions" before IAM, and "background work" before SQS/Lambda.

## Section Summaries

Every major section should end with a section summary. The summary should be prose or bullets that answer:

- What was the main idea?
- Why does it matter architecturally?
- How does it connect to AWS?
- How could it come up in the interview?

Example summary shape:

> Section summary: A load balancer is not just a traffic splitter. It is the public entry point that hides multiple backend servers, performs health checks, and helps the system survive individual server failure. In AWS, this maps most directly to Elastic Load Balancing, often combined with Auto Scaling, security groups, and CloudWatch alarms.

## Diagrams

Use Mermaid diagrams when they clarify flow, ownership, state, or architecture. Do not add diagrams as decoration.

Good diagram types:

- Sequence diagrams for request flows.
- Flowcharts for architecture.
- State diagrams for lifecycle topics.
- Tables for service comparisons and trade-offs.

Diagrams should have captions or surrounding explanation. A reader should know what the diagram proves.

## Tables

Use tables for comparisons, especially:

- RDS vs DynamoDB
- EC2 vs Lambda vs containers
- Security groups vs NACLs
- SQS vs SNS vs EventBridge
- vertical vs horizontal scaling
- cache-aside vs write-through caching
- synchronous vs asynchronous processing

Tables should explain consequences, not only definitions.

## Resume Defense Style

Resume defense documents should be unusually honest. For each polished claim, include:

- What the claim implies
- What an interviewer may ask
- What Akshat must understand
- A technically honest answer
- A safer phrasing if pressed
- Red flags to avoid

The tone should not be apologetic. The aim is ownership: acknowledge AI assistance where needed, then demonstrate that the architecture, trade-offs, debugging, and limitations are understood.

## Uncertainty Handling

If a detail is uncertain, mark it clearly. Do not silently invent confidence.

Use labels such as:

- Confirmed
- Likely
- Anecdotal
- Needs verification
- Resume-risk item

Official Amazon/AWS sources should be treated as authoritative. Reddit, Glassdoor, GitHub repos, and blog posts can be used as interview-signal sources, but they must be labelled as anecdotal unless independently confirmed.

## Depth Standard

The notes should be deep enough that Akshat can answer follow-up questions. For example, "Redis is a cache" is not enough. The notes should explain:

- why caching reduces latency
- cache hit vs cache miss
- cache invalidation
- TTLs
- stale data
- memory limits
- when Redis is a poor choice
- how AWS ElastiCache maps to Redis
- how this connects to VELEXAR's latency claim

## Tone

The writing should be clear, patient, and direct. It should assume Akshat is intelligent but may not yet have all the background. Avoid sounding like documentation copied from AWS. Explain the mental model first, then the service name.

## Interview Questions

Interview questions are mandatory for any section that could plausibly come up in the phone screen. They should include both direct questions and follow-up questions.

Good interview questions should test:

- definitions
- trade-offs
- failure modes
- AWS service mapping
- resume-specific defense
- "why did you choose this?" reasoning
- "what would you improve?" reflection

For example, a Redis section should not only ask "What is Redis?" It should also ask:

- Why would Redis reduce latency in VELEXAR?
- What happens on a cache miss?
- How do you avoid serving stale data?
- When would caching make a system worse?
- How would you run Redis on AWS?

## Disagreement / Adjustment From The Week 9 Style

The Week 9 notes rely heavily on "Quick check" questions. For interview prep, those are useful but insufficient. We should add real section summaries because Akshat explicitly wants learning notes that can be revised and understood as standalone explanations.

The Week 9 notes are source-bounded to a lecture transcript. The Amazon prep notes should be source-aware but not source-limited: official AWS documentation, Amazon Careers pages, and verified fundamentals should be used to fill in the full picture. Any interview reports from Reddit or Glassdoor should be kept separate from confirmed technical content.
