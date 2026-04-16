# **Architecting Agentic Capabilities: A Comprehensive Guide to Authoring SKILL.md in Google Antigravity**

The landscape of software engineering has undergone a profound paradigm shift, transitioning from localized, manual editing methodologies toward highly orchestrated, autonomous workflows. Released in November 2025, Google Antigravity represents a fundamental departure from traditional, autocomplete-focused integrated development environments.1 By embedding autonomous multi-agent systems directly into the developer workflow, Antigravity functions less as a conventional text editor and more as a sophisticated "Mission Control" interface for directing complex engineering tasks.2 Powered primarily by advanced reasoning models such as Gemini 3 Pro and Gemini 3 Flash, the platform enables true agent-first development where artificial intelligence handles project planning, multi-file code generation, automated testing, and execution validation.1

However, the efficacy of an autonomous agent is strictly bound by its operational context and its understanding of environmental constraints. This introduces the concept of "Agent Skills"—lightweight, modular, and ephemeral capability extensions that teach the underlying artificial intelligence how to execute highly specialized tasks in consistent, repeatable ways.1 The primary mechanism for defining these capabilities is the SKILL.md file.5 Far beyond a simple documentation file, the SKILL.md construct serves as the cognitive framework, semantic router, and operational boundary for an AI agent navigating a codebase.1 This report provides an exhaustive, expert-level analysis of the architecture, best practices, and repeatable workflows necessary to build a comprehensive SKILL.md definition, enabling organizations to harness the full potential of Google Antigravity and scale their development velocity.

## **The Paradigm of Agent Skills and Context Management**

Before dissecting the specific syntax and directory structure of the SKILL.md file, it is critical to understand the underlying computational philosophy that necessitates its existence: the mitigation of context saturation.5 Historically, extending the capabilities of a Large Language Model required embedding vast amounts of instructional text, application programming interface schemas, style guides, and business logic directly into a monolithic system prompt.4 As engineering workflows scaled in complexity, this monolithic approach led to severe "instruction fatigue," degraded reasoning performance, and exorbitant token consumption, ultimately rendering the agent incapable of maintaining focus over long-running sessions.4

The Agent Skills framework, an open standard initially conceptualized in 2025 and rapidly adopted across the industry, resolves this limitation via an architectural pattern known as "progressive disclosure".6 Under this paradigm, a skill is treated as a dormant directory of instructions, scripts, and resources. The agent relies on a semantic routing layer to evaluate the developer's natural language intent against a vast library of potential skills, loading only the necessary SKILL.md file into its active context window exactly when it is deemed semantically relevant.4 Once the specialized task is completed, the skill’s instructions are actively flushed from the context window, ensuring the agent remains focused and computationally performant for subsequent tasks.4

This modularity transforms the IDE into a highly dynamic reasoning engine, distinguishing it sharply from preceding technologies. The operational differences between agent-first platforms and traditional coding assistants highlight the necessity of structured skills.

| Feature Paradigm | Traditional Coding Assistants (e.g., Cursor) | Agent-First Platforms (Google Antigravity) |
| :---- | :---- | :---- |
| **Core Functionality** | Inline, easy-to-understand code suggestions and localized refactoring.1 | Automated planning, execution, and multi-agent collaboration across complex architectures.1 |
| **Workflow Mechanics** | Developer-focused manual editing; speeds up existing manual workflows.1 | High-level task delegation; autonomous debugging and visual verification.1 |
| **Context Management** | Relies on static workspace indexing and dense system prompting.5 | Utilizes progressive disclosure, loading modular SKILL.md files dynamically.8 |
| **Execution Capability** | Typically restricted to text generation within the active editor pane.2 | Possesses terminal execution policies to autonomously run bash scripts, tests, and deployments.2 |

## **The Progressive Disclosure Hierarchy**

The progressive disclosure architecture operates across distinct levels of context integration, dictating precisely how and when the Antigravity agent consumes computational tokens.8 This hierarchy is what allows a developer to configure an environment with hundreds of specialized skills without degrading the base model's performance.

| Context Level | Component | Token Consumption | Trigger Mechanism | Operational State |
| :---- | :---- | :---- | :---- | :---- |
| **Level 1** | YAML Frontmatter (name, description) | Minimal (\~50 to 100 tokens per skill).8 | Always active in the agent's background index upon workspace initialization.8 | Used continuously by the semantic router for implicit invocation matching against user prompts.8 |
| **Level 2** | SKILL.md Markdown Body | Moderate (\< 5000 tokens per invocation).8 | Loaded dynamically upon explicit command or implicit algorithmic matching.8 | Injected directly into the active context window to dictate step-by-step logic, constraints, and few-shot examples.8 |
| **Level 3+** | Associated Resources & Scripts | Zero until explicitly accessed via bash.8 | Executed or read on-demand by the agent based on Level 2 instructions.8 | Kept entirely out of the context window; only the standard output (stdout) or standard error (stderr) is ingested.4 |

This architecture enables an Antigravity agent to theoretically possess an unbounded number of highly specialized skills, making the meticulous authoring of the SKILL.md file the single most critical factor in achieving agentic reliability.

## **Architectural Topography of a Skill Directory**

A well-architected agent skill is not merely a single markdown document; it is a self-contained, highly structured file module. The directory structure must be entirely predictable for the Antigravity framework to parse, validate, and load it effectively.5 The standardized structure for an Antigravity skill directory requires a specific topological layout to enforce operational boundaries.4

The root of the skill (e.g., my-skill/) acts as the encapsulation boundary. Everything the agent requires to execute the task must exist within this directory to ensure portability across different projects, repositories, and developer environments.

1. **SKILL.md (Required):** The central nervous system of the module. It contains the YAML frontmatter required for semantic discovery and the markdown body containing the execution logic.1  
2. **scripts/ (Optional but Highly Recommended):** A repository for executable code (e.g., .py, .sh, .js). The agent utilizes these scripts to perform repeatable, deterministic tasks that are considered too complex, sensitive, or risky for raw language model generation.4  
3. **references/ (Optional):** A sub-folder housing documentation, application programming interface schemas, style guides, or lookup tables (typically .md, .txt, or .json formats) that the agent can read on-demand using specific extensible markup language tags.7  
4. **assets/ (Optional):** Binary files, image templates, static user interface mockups, or logo files utilized in the generation of project outputs.11  
5. **Entry Point Scripts (Optional):** Root-level executable files such as run.py or util.sh for immediate execution directives.11

By confining the autonomous agent's operational scope strictly to this directory structure, organizations enforce a hardened boundary that prevents the artificial intelligence from hallucinating unsupported system commands, fabricating non-existent programmatic interfaces, or altering files outside the defined scope of the task.

## **Anatomy of the SKILL.md Construct: Routing and Directives**

The SKILL.md file is structurally bifurcated into two distinct computational sections: the YAML Frontmatter and the Markdown Body.1 Each serves a fundamentally different cognitive purpose for the Gemini 3 Pro model driving the Antigravity IDE.

## **The YAML Frontmatter: Semantic Routing and Discovery**

Located at the absolute top of the file, the YAML frontmatter acts as the skill's advertisement to the Antigravity Agent Manager.1 When a developer issues a natural language prompt, the agent's routing layer vectorizes the prompt and compares it against the descriptions housed in the frontmatter of all available skills within the local and global registries.9

The frontmatter requires, at minimum, two declarative fields: a name and a description.9

* **The name Directive**: This must be a concise, hyphenated string representing the specific capability (e.g., production-code-audit, wcag-audit-patterns, database-schema-validator).11 This string is utilized for explicit invocation, which occurs when a developer types a command like /production-code-audit or @production-code-audit directly into the Antigravity terminal or chat prompt.9  
* **The description Directive**: This is arguably the most crucial element for implicit invocation. The underlying agent uses this field to autonomously decide when to activate the skill without direct human prompting.9

The engineering of the description field requires immense precision. Descriptions must not describe the internal mechanics of *how* the skill operates, but rather outline *when* it is semantically relevant and establish the *boundaries* of its capability.9 Ambiguous or overly broad descriptions lead to frequent misfiring of skills, corrupting the context window, while overly narrow descriptions result in the agent failing to utilize the tool when necessary.

For example, a suboptimal description might simply state: *A skill that uses Python to check database schemas and fix them.* This lacks trigger conditions and boundary definitions. Conversely, an optimized description provides semantic precision: *Validates relational database schemas against internal enterprise constraints. Use this skill autonomously when the user requests database migrations, schema creation, or when ORM models are altered. Do not use for NoSQL databases.* This optimized iteration provides precise natural language triggers, defines the context of the developer's request, and establishes a clear negative boundary (NoSQL), ensuring the semantic router categorizes it with high fidelity.

## **The Markdown Body: Persisted Prompt Engineering**

Once the semantic router identifies a match within the YAML frontmatter, the Antigravity framework reads the Markdown body and injects it entirely into the Gemini model's active context window.8 This section is effectively advanced prompt engineering persisted to the filesystem.11 To maximize the reliability of the language model, a comprehensive Markdown body should be structured into highly specific operational headers that guide the agent's reasoning mechanics sequentially.

#### **1\. The Definitive Goal Statement**

The file must begin with a clear, definitive statement of the skill's overarching objective. This grounds the agent computationally and sets the macroscopic directive before it processes granular implementation instructions.11 The goal acts as a semantic anchor throughout the execution lifecycle.

#### **2\. Articulation of Trigger Conditions**

While the YAML frontmatter handles high-level probabilistic routing, the Markdown body must reinforce the operational context.13 Explicitly listing scenarios helps the agent understand its current state within a multi-step workflow. By defining "When to use this skill," the developer provides the agent with immediate contextual validation.13 For instance, a trigger condition might specify that the skill should only be executed immediately following the modification of a file located in the db/migrations directory, or prior to generating an architectural implementation plan.

#### **3\. Deterministic Step-by-Step Logic**

Unlike legacy coding assistants that rely on unstructured, immediate text generation, Antigravity functions as an autonomous actor capable of multi-step planning and self-validation.1 Therefore, the instructions within the SKILL.md must dictate a highly deterministic, sequential workflow.11 The utilization of checklist patterns is considered a critical best practice in this domain. Utilizing markdown checkboxes forces the underlying language model to process operations sequentially, updating its internal state after each step, rather than attempting simultaneous execution which often leads to hallucinatory outputs.16

#### **4\. Constraints and Deterministic Guardrails**

Large Language Models inherently lean toward creative, probabilistic generation. In the realm of strict software engineering, this "creativity" frequently manifests as hallucinations, non-compliant architectural choices, or the execution of dangerous terminal commands. Consequently, the SKILL.md must include a section exclusively dedicated to constraints—strict "Do Not" rules.11 These negative constraints are mathematically powerful in steering the model's attention mechanisms away from undesirable outputs. Examples of necessary constraints include explicit prohibitions against executing destructive queries (e.g., DROP TABLE or DELETE) 11, restrictions against utilizing unapproved styling frameworks unless explicitly requested 17, or strict mandates preventing the agent from bypassing visual verification steps before committing files to version control.17

#### **5\. Few-Shot Optimization Examples**

One of the most empirically effective techniques for reducing inference errors in large language models is few-shot prompting. By providing two to three explicit examples of expected inputs and their corresponding ideal outputs directly within the SKILL.md body, the author drastically improves the reliability of the agent.4 These examples align the agent's output format with strict project conventions, effectively eliminating the need for constant, manual human correction during the generation phase.

## **Resource Orchestration and Script Integration**

The true operational power of Google Antigravity lies in its architecture as a tool-using system, transcending mere text generation to interact dynamically with the local filesystem, the network, and the terminal execution environment.2 A comprehensive SKILL.md must elegantly bridge text-based reasoning with deterministic scripts and static reference files to function as a complete software development asset.

## **Utilizing Extensible Markup Language Tags for Resources**

To prevent the agent from indiscriminately searching a massive corporate codebase or hallucinating application programming interface parameters, the SKILL.md framework utilizes an \<available\_resources\> XML block.7 This structured metadata tells the agent exactly which files are bundled within the skill directory, where they are located, and what specific data they contain, facilitating the Level 3 progressive disclosure mechanism.7

When authoring this section, syntactic precision is critical. The agent parses these tags to decide which internal bash commands it must execute to retrieve the necessary context. The format requires defining a \<resource\> block containing both \<location\> and \<description\> nodes.7 By presenting resources in this structured format, the agent is trained to treat them as on-demand lookup tables. For example, if a developer requests the implementation of a new data model, the agent will parse the XML block, autonomously read the relevant references/schema.md into its context, write the compliant code, and then release the reference file from context to preserve token limits.8

Furthermore, developers must include markdown sections that summarize these resources for the agent. Providing a "Knowledge Maintenance" section that clearly labels update scripts—such as instructing the agent to execute scripts/update-references.sh if it suspects documentation is stale—ensures the agent can autonomously maintain its own factual grounding without human intervention.7

## **Bridging Reasoning to Action: Script Execution**

Antigravity’s deep terminal integration fundamentally shifts the integrated development environment into an active execution environment.1 SKILL.md files are designed to instruct the agent on exactly how to leverage executable scripts—whether written in Python, Node.js, Bash, or Go—located in the bundled scripts/ directory.4

This mechanism provides three massive architectural advantages for engineering teams:

1. **Safety and Determinism:** Complex, destructive, or highly sensitive mathematical logic is handled by deterministic, auditable, and unit-tested scripts rather than probabilistic language model generation.4  
2. **Token Efficiency Mastery:** When the Antigravity agent executes a bundled script via the bash environment, the underlying source code of that script is never loaded into the context window. The agent only reads and reacts to the standard output or standard error generated by the script.8 This allows for massive, complex computations to occur with zero context bloat.  
3. **Language Agnosticism:** The artificial intelligence can execute any script that is supported by the local operating system environment, breaking free of language-specific limitations.4

When authoring the SKILL.md, script execution must be mandated explicitly. The agent must be instructed on the exact relative path of the script, the required argument flags it must pass based on the user's prompt, and how it must interpret the resulting output.4 For instance, an instruction might mandate that the agent execute a validation script using the syntax bash scripts/validate\_ui.sh \--component \<Component\_Name\>, and explicitly direct the agent to analyze the standard output. The instructions must detail the logical branching: if the script returns an exit code of zero, the agent may proceed; if it returns an error string, the agent must ingest that error, autonomously refactor the code to resolve the warning, and execute the script a second time.

## **Navigating Terminal Execution Policies**

When designing skills that execute scripts, authors must account for Google Antigravity's configurable Terminal Execution Policy, which governs the safety parameters of the environment.1 Users can configure the IDE in several distinct modes to balance autonomy with security.

The "Always Proceed" or auto-execution policy permits the agent to run standard terminal commands without prompting the human developer, which is ideal for safe, read-only scripts or local test suites.1 Conversely, the "Request Review" policy forces the agent to draft the terminal command and halt execution until the human developer explicitly approves it; this is critical for deployment scripts or commands that mutate state.1 Finally, the "Agent Decides" policy allows the Gemini 3 Pro model to evaluate the potential destructiveness of a command probabilistically and decide whether manual confirmation is warranted.1 A robust, enterprise-grade SKILL.md anticipates these policies by explicitly instructing the agent to pause and ask the user for confirmation within the markdown logic before executing any script that alters databases or cloud infrastructure, ensuring strict adherence to the agent-assisted development philosophy.1

## **Advanced Design Patterns for Multi-Agent Orchestration**

As organizations scale their adoption of Google Antigravity, simplistic, single-file skills rapidly evolve into complex orchestration layers. Achieving enterprise-grade reliability across diverse engineering disciplines requires adhering to advanced architectural design patterns that leverage the platform's multi-agent capabilities.18

## **Atomic Logic and the Unix Philosophy for Agents**

The most common point of failure in modern agentic workflows is the implementation of the "monolithic skill"—a single SKILL.md file attempting to encompass full-stack UI development, backend database management, and cloud deployment simultaneously.4 This anti-pattern violates the core tenet of progressive disclosure, drastically overloading the context window and diluting the agent's attention mechanism, leading to code regression and logical looping.

Instead, skills must be designed atomically, adhering strictly to the Unix philosophy: write a skill to execute one discrete task, and execute it flawlessly.4 Rather than constructing a monolithic "senior-developer" skill, organizations must build separate, highly focused modules. The research indicates community and enterprise patterns favor discrete skills such as react-component-generator, sql-schema-architect, wcag-audit-patterns for accessibility compliance, and vercel-deployment-manager for infrastructure orchestration.14

Google Antigravity’s native multi-agent system supports this atomic approach intrinsically.1 The platform features specialized multi-agent pattern skills, such as @\[dispatching-parallel-agents\], which allows a primary supervisor agent to seamlessly pass context between these atomic micro-skills, dispatching tasks to parallel subagents to complete complex feature requests efficiently.3

## **Managing State Through Artifact Generation**

Because skills are designed to be ephemeral and are flushed from active memory upon execution completion 4, the agent requires a persistent mechanism to track state across long-running, multi-hour engineering sessions. The SKILL.md must instruct the agent to generate tangible system artifacts to record its architectural decisions.1

Antigravity natively categorizes artifacts into several distinct types, including Task Lists, Implementation Plans, Walkthroughs, Code Diffs, and Screenshots.2 A sophisticated SKILL.md does not merely suggest these; it explicitly demands artifact creation at specific workflow intervals. Before writing any code, the skill must mandate the generation of a structured "Implementation Plan" artifact detailing the architectural changes required across the codebase.2 Once the plan is established, the agent must be instructed to utilize a "Task List" artifact to algorithmically check off each implementation phase. Upon final execution, the skill should dictate the generation of a "Walkthrough" artifact, summarizing the changes applied and detailing the manual testing procedures required by the human developer.2

Furthermore, Antigravity introduces specialized sub-agents for visual quality assurance. For instance, a skill can leverage the browser-verifier or ui-validator tools to capture screenshots of the application state before and after a change, enabling automated Chrome testing and visual difference analysis without manual human intervention.17

## **Mitigating Contextual "Ghost Instructions"**

A pervasive computational issue in prolonged agentic sessions is the lingering effect of "ghost instructions"—directives from a previously executed, highly specific skill that bleed into subsequent, unrelated tasks due to imperfect context flushing.4 To completely mitigate this, a robust SKILL.md must define clear and unyielding "End Task" parameters. By instructing the language model to explicitly generate a closing phrase—such as "Task Complete. Awaiting next directive"—the underlying architecture's attention mechanism is given a definitive signal to reset. This compartmentalizes the semantic context of the skill, preventing hallucinatory cross-contamination as the developer moves to the next phase of the project.4

## **Real-World Execution Scenarios and Use Cases**

The practical application of these skills is vast. In the realm of web development, a developer can prompt the Antigravity system to generate a functional Pomodoro timer. By utilizing a combination of UI generation and logic skills, the agent autonomously creates the HTML, CSS, and JavaScript files, configures a 25-minute default timer, and establishes a visual progress ring.24 In a subsequent iteration, the developer can verbally request the addition of sound effects and custom input fields, and the agent will load the necessary refactoring skills to patch the existing files.24 Similarly, for game development, an agent can autonomously plan and generate a fully functional Python Snake game using Pygame, handling everything from dependency installation and collision detection to game-over logic and the generation of a comprehensive README.md file.1

In more complex enterprise scenarios, skills are utilized for workflow orchestration patterns, handling distributed systems, state determinism, and Saga pattern implementations.14 Skills like production-code-audit are designed to autonomously execute deep scans of an entire codebase line-by-line to verify architectural integrity, while Model Context Protocol (MCP) integrations allow skills to interact directly with external databases or deploy applications instantly to platforms like Netlify or Vercel with a single natural language command.14 Even in the highly restrictive domain of embedded systems and bare-metal microcontroller development, where developers are traditionally hesitant to rely on artificial intelligence, highly constrained skills focused on compiler construction and error handling in languages like C and Rust are proving invaluable.25

## **A Repeatable Workflow for Building and Deploying Skills**

To fully harness the capabilities of Google Antigravity, engineering teams require a systematic, highly repeatable workflow for the ideation, scaffolding, validation, and deployment of Agent Skills globally.26 Relying on ad-hoc text file creation by individual developers leads to brittle agents, inconsistent operational logic, and fractured organizational knowledge.19

## **Phase 1: Ideation and Scaffolding via the Skill-Creator Meta-Skill**

The foundation of a reliable, repeatable workflow leverages Google Antigravity's own meta-cognitive capabilities. Developers do not need to, and generally should not, write SKILL.md files entirely from scratch. Instead, they must utilize the natively provided /skill-creator meta-skill, which acts as a foundational bootstrap for new capabilities.9

The developer initiates the process by opening the Antigravity command interface and triggering the meta-skill via @\[skill-creator\] or the slash command /skill-creator.15 This invokes a guided framework wizard. The agent systematically queries the developer to understand the core requirements: it asks for the primary purpose of the skill, the precise natural language triggers for activation, the tools it will require (such as local file read/write access, glob search, bash execution, or WebFetch capabilities), and whether the skill should be structured as a simple self-contained markdown file or a complex modular directory requiring external scripts.9

Based on the developer's natural language responses, the agent autonomously generates a syntactically perfect, modularized directory structure. It writes the SKILL.md file to disk, complete with the YAML frontmatter, markdown checklists, constraint sections, and placeholder bash scripts, ensuring absolute adherence to all required structural best practices without human boilerplate coding.19

## **Phase 2: Iterative Refinement and Rigorous Validation**

While the /skill-creator provides an exceptional initial scaffold, human oversight and engineering refinement are strictly mandatory. The machine-generated SKILL.md is frequently overly verbose and requires manual distillation to function consistently and economically within token limits.20

The engineering team must execute a pruning phase, editing the Markdown body to ensure the instructions remain concise, ideally under the recommended 500-line threshold.29 Developers must remove generic boilerplate language and replace it with highly specific, domain-relevant terminology. Following pruning, the constraint section must be hardened; developers must ensure the "Do Not" rules are absolutely airtight, specifically regarding destructive terminal commands or unauthorized network access.11

Once the instructions are refined, the skill must be tested for idempotency. The developer executes the skill multiple times against the identical codebase state.17 The output generated by the agent must be highly deterministic. Teams should utilize the Antigravity built-in preview browser and visual UI validators to ensure the skill yields consistent visual and functional results without degradation across multiple invocations.1 Finally, an audit of all resource paths must be conducted, verifying that every file path listed in the \<available\_resources\> XML tags maps perfectly to an actual, existing file in the references/ and scripts/ directories, preventing the agent from crashing due to file-not-found errors.7

## **Phase 3: Strategic Deployment Topology**

Once a skill has been validated for production use, it must be deployed into the correct operational environment. Both Google Antigravity and the companion terminal-native Gemini CLI support distinct local and global skill deployment topologies, allowing for granular control over agent capabilities.23

| Deployment Topology | Directory Path | Scope and Application |
| :---- | :---- | :---- |
| **Project-Local Deployment** | .agent/skills/my-skill/ 13 | Utilized when a skill contains logic strictly specific to a single codebase (e.g., a proprietary build script or an internal schema validator). This topology ensures the skill is version-controlled via Git and shared symmetrically with all developers working within that specific repository.30 |
| **Global/Personal Deployment** | \~/.gemini/antigravity/skills/ 4 | Utilized for universally applicable tools (e.g., a general formatting agent, a WCAG accessibility auditor, or a standard semantic committer). Skills placed in this root directory are loaded into the background index of every project the developer opens globally across the IDE.17 |
| **Enterprise Fleet Deployment** | Managed via central registries | For large organizations, skills are managed via unified command line interfaces. Using commands like npx skills add \<skill-name\> \-a antigravity or pulling directly from secure Git repositories ensures standardization across the entire engineering fleet.26 |

## **Phase 4: Lifecycle Maintenance and Context Auditing**

For engineering teams operating across multiple microservices and scaling their autonomous capabilities, manual directory management rapidly becomes a critical bottleneck. The repeatable workflow must incorporate centralized management tools for ongoing maintenance.26

To avoid the tedium of manual file synchronization, teams utilize unified management interfaces to pull skills directly from central repositories. Executing a command such as gemini skills install https://github.com/organization/agent-skills.git \--path skills/custom-validator instantly provisions the latest validated skill to the local machine.26

Furthermore, developers must perform periodic context auditing. By running the gemini skills list command, the developer can instantly audit which skills are currently loaded into the agent's semantic index.26 If the semantic router begins misfiring due to overlapping skill descriptions across hundreds of tools, the developer can utilize the /skills disable \<name\> command to temporarily decouple a skill from the active index without permanently deleting the underlying files, thereby maintaining optimal agent performance and preventing context dilution.26

## **The Comprehensive SKILL.md Template Construction**

Synthesizing all aforementioned architectural principles, token management strategies, XML orchestration methods, and progressive disclosure mechanics, it is necessary to establish a definitive, production-ready SKILL.md blueprint. The following template serves as the culminating architectural standard for implementing highly complex, multi-modal agentic extensions within the Google Antigravity environment.

## ---

**name: enterprise-api-scaffolder description: Scaffolds a new RESTful API endpoint using internal enterprise architectural patterns, Express.js, and strict Zod validation. Use this skill autonomously when the user requests a new backend route, a new data-fetching controller, or API generation. Do not use this skill for frontend React UI generation, Python codebases, or GraphQL implementations.**

# **Enterprise API Scaffolding Orchestrator**

## **1\. Primary Goal**

Your objective is to generate secure, highly structured, and fully documented Node.js API endpoints that strictly adhere to the organization's Controller-Service-Repository architectural pattern.

## **2\. Trigger Conditions and Operational Context**

You must invoke this logical sequence and follow these instructions specifically when:

* Creating a new GET, POST, PUT, or DELETE route within the backend directory.  
* Refactoring an existing monolithic endpoint into the modular three-tier architecture.  
* The user issues natural language commands such as "build an endpoint," "create an API," or "add a backend route."

## **3\. Resource Discovery and Grounding**

Before analyzing the workspace or writing any codebase modifications, you must read and internalize the provided architectural guidelines and schema definitions to ground your output.

\<available\_resources\>

references/api\_design\_spec.md

Enterprise standards for JSON response formatting, HTTP status codes, and error handling wrappers. Read this immediately to ensure your generated payload structures are fully compliant.

references/security\_middleware.md

Documentation detailing the implementation of required authentication tokens, rate limiting parameters, and CORS headers.

\</available\_resources\>

## **4\. Deterministic Execution Logic (Checklist)**

You must process the following implementation steps sequentially. Do not proceed to a subsequent step until the current step is fully executed, verified, and its state is recorded.

* \[ \] **Step 1: Artifact Generation.** Generate an Implementation Plan artifact detailing the new specific files to be created (Route, Controller, Service, Repository) and map the expected data flow. Ask the user for explicit approval before proceeding.  
* \[ \] **Step 2: Schema Definition.** Create a Zod validation schema for the incoming request payload and save it in the /schemas directory.  
* \[ \] **Step 3: Database Logic.** Implement the data access logic in a new Repository file. Use the local environment bash to execute the scripts/check\_db\_conn.sh script to mathematically verify database connectivity. Read the stdout. If it fails, halt execution and report the error.  
* \[ \] **Step 4: Business Logic.** Implement the Service layer file, handling all data transformations and enterprise business rules isolated from HTTP context.  
* \[ \] **Step 5: Controller & Routing.** Implement the Controller (handling HTTP requests/responses) and bind it to the Express router, ensuring you inject the required middleware as documented in the security\_middleware.md resource.  
* \[ \] **Step 6: Quality Assurance and Sub-Agent Dispatch.** Run the test scaffolding script. Execute the terminal command: bash scripts/generate\_tests.sh \--route \<Route\_Name\>. Analyze the standard output. Ensure all unit tests report an exit code of 0 before finalizing the codebase changes.

## **5\. Strict Constraints (Negative Guardrails)**

You must adhere to the following limitations unconditionally under all circumstances:

* **DO NOT** write raw SQL queries in the Controller or Service layers. All database interactions must be strictly confined to the Repository layer.  
* **DO NOT** bypass Zod input validation for any POST or PUT requests.  
* **DO NOT** return raw database error stack traces to the client side. Always wrap errors using the standard ApiError class defined in the design spec.  
* **DO NOT** execute any terminal commands that install new npm packages or alter the package.json without requesting user review via the Terminal Execution Policy first.

## **6\. Few-Shot Optimization Examples**

## **Example 1: Standard Payload Response Format**

**Input Context:** Returning queried user data successfully.

\*\*Expected Output Implementation:\*\*javascript

return res.status(200).json({

success: true,

data: userObject,

metadata: { timestamp: new Date().toISOString(), correlationId: req.headers\['x-request-id'\] }

});

\#\#\# Example 2: Error Handling Implementation  
\*\*Input Context:\*\* A user provides an invalid email string during registration.  
\*\*Expected Output Implementation:\*\*  
\`\`\`javascript  
throw new ApiError(400, "Validation Failed", {   
  fields: \["email"\],   
  message: "Email format is invalid according to RFC standards."   
});

## **7\. End Task Directive**

Once the API is fully scaffolded, tests have passed, and the final Walkthrough artifact has been explicitly generated, output the exact phrase: "API Scaffolding Task Complete. Awaiting next directive." This signals the successful termination of the skill execution and flushes the context.

\#\# Strategic Conclusions

The rapid transition from manual text-editing methodologies to agentic orchestration via platforms like Google Antigravity is not merely an incremental change in integrated tooling; it represents a fundamental paradigm shift in the discipline of software engineering. However, the raw computational power of an autonomous development environment is directly and strictly proportional to the quality, precision, and boundaries of the instructions governing its agents. 

By comprehensively understanding the progressive disclosure architecture, engineering teams can successfully prevent the context saturation that routinely plagues traditional language model interactions. Utilizing the YAML frontmatter for highly precise semantic routing ensures that agents load dense expertise only when it is operationally relevant to the task at hand. Furthermore, coupling markdown-based prompt engineering with the deterministic, token-free execution of bundled shell and Python scripts transitions the artificial intelligence from a passive, probabilistic text generator into an active, highly reliable, tool-wielding participant in the software development lifecycle.

Ultimately, the creation of \`SKILL.md\` files must not be viewed as an ad-hoc configuration task left to the whims of individual developers. It must be treated as the formal codification of an organization's internal engineering culture, its security practices, and its strictest architectural standards.\[5, 10\] By implementing the rigorous, repeatable workflows outlined in this report—leveraging the native \`/skill-creator\` for scaffolding, adhering strictly to atomic design patterns, and utilizing robust command-line deployment topologies—organizations can systematically build a fleet of highly specialized, infinitely patient, and perfectly compliant artificial intelligence agents, thereby scaling their software development velocity to unprecedented levels.

#### **Works cited**

1. How to Set Up and Use Google Antigravity | Codecademy, accessed March 2, 2026, [https://www.codecademy.com/article/how-to-set-up-and-use-google-antigravity](https://www.codecademy.com/article/how-to-set-up-and-use-google-antigravity)  
2. Getting Started with Google Antigravity, accessed March 2, 2026, [https://codelabs.developers.google.com/getting-started-google-antigravity](https://codelabs.developers.google.com/getting-started-google-antigravity)  
3. Antigravity NEW Update is HUGE\! Agent Skills, Subagents, AI Automation, and More\!, accessed March 2, 2026, [https://www.youtube.com/watch?v=oRAeNVx2kqM](https://www.youtube.com/watch?v=oRAeNVx2kqM)  
4. Master Google Antigravity Skills: Build Autonomous AI Agents | VERTU, accessed March 2, 2026, [https://vertu.com/lifestyle/mastering-google-antigravity-skills-a-comprehensive-guide-to-agentic-extensions-in-2026/](https://vertu.com/lifestyle/mastering-google-antigravity-skills-a-comprehensive-guide-to-agentic-extensions-in-2026/)  
5. Tutorial : Getting Started with Google Antigravity Skills, accessed March 2, 2026, [https://medium.com/google-cloud/tutorial-getting-started-with-antigravity-skills-864041811e0d](https://medium.com/google-cloud/tutorial-getting-started-with-antigravity-skills-864041811e0d)  
6. How to Write and Implement Agent Skills \- DigitalOcean, accessed March 2, 2026, [https://www.digitalocean.com/community/tutorials/how-to-implement-agent-skills](https://www.digitalocean.com/community/tutorials/how-to-implement-agent-skills)  
7. Beyond Prompt Engineering: Using Agent Skills in Gemini CLI | by ..., accessed March 2, 2026, [https://medium.com/google-cloud/beyond-prompt-engineering-using-agent-skills-in-gemini-cli-04d9af3cda21](https://medium.com/google-cloud/beyond-prompt-engineering-using-agent-skills-in-gemini-cli-04d9af3cda21)  
8. Agent Skills \- Claude API Docs, accessed March 2, 2026, [https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview)  
9. Agent Skills \- OpenAI for developers, accessed March 2, 2026, [https://developers.openai.com/codex/skills/](https://developers.openai.com/codex/skills/)  
10. The Busy Person's Intro to Claude Skills (a feature that might be bigger than MCP) \- Reddit, accessed March 2, 2026, [https://www.reddit.com/r/ClaudeAI/comments/1pq0ui4/the\_busy\_persons\_intro\_to\_claude\_skills\_a\_feature/](https://www.reddit.com/r/ClaudeAI/comments/1pq0ui4/the_busy_persons_intro_to_claude_skills_a_feature/)  
11. Authoring Google Antigravity Skills \- Google Codelabs, accessed March 2, 2026, [https://codelabs.developers.google.com/getting-started-with-antigravity-skills](https://codelabs.developers.google.com/getting-started-with-antigravity-skills)  
12. Building Agent Skills with skill-creator | by Daniela Petruzalek ..., accessed March 2, 2026, [https://medium.com/google-cloud/building-agent-skills-with-skill-creator-855f18e785cf](https://medium.com/google-cloud/building-agent-skills-with-skill-creator-855f18e785cf)  
13. Agent Skills \- Google Antigravity Documentation, accessed March 2, 2026, [https://antigravity.google/docs/skills](https://antigravity.google/docs/skills)  
14. antigravity-awesome-skills/CATALOG.md at main \- GitHub, accessed March 2, 2026, [https://github.com/sickn33/antigravity-awesome-skills/blob/main/CATALOG.md](https://github.com/sickn33/antigravity-awesome-skills/blob/main/CATALOG.md)  
15. antigravity-skills/docs/Antigravity\_Skills\_Manual.en.md at main ..., accessed March 2, 2026, [https://github.com/guanyang/antigravity-skills/blob/main/docs/Antigravity\_Skills\_Manual.en.md](https://github.com/guanyang/antigravity-skills/blob/main/docs/Antigravity_Skills_Manual.en.md)  
16. Skill authoring best practices \- Claude API Docs, accessed March 2, 2026, [https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)  
17. Share your best Google Antigravity Skills, Rules & Workflows. : r/google\_antigravity \- Reddit, accessed March 2, 2026, [https://www.reddit.com/r/google\_antigravity/comments/1r3hlis/share\_your\_best\_google\_antigravity\_skills\_rules/](https://www.reddit.com/r/google_antigravity/comments/1r3hlis/share_your_best_google_antigravity_skills_rules/)  
18. sickn33/antigravity-awesome-skills: The Ultimate Collection of 900+ Agentic Skills for Claude Code/Antigravity/Cursor. Battle-tested, high-performance skills for AI agents including official skills from Anthropic and Vercel. \- GitHub, accessed March 2, 2026, [https://github.com/sickn33/antigravity-awesome-skills](https://github.com/sickn33/antigravity-awesome-skills)  
19. skill-creator | Skills Marketplace \- LobeHub, accessed March 2, 2026, [https://lobehub.com/skills/rshankras-claude-code-apple-skills-skill-creator](https://lobehub.com/skills/rshankras-claude-code-apple-skills-skill-creator)  
20. Anthropic Released 32 Page Detailed Guide on Building Claude Skills : r/ClaudeAI \- Reddit, accessed March 2, 2026, [https://www.reddit.com/r/ClaudeAI/comments/1r3hr40/anthropic\_released\_32\_page\_detailed\_guide\_on/](https://www.reddit.com/r/ClaudeAI/comments/1r3hr40/anthropic_released_32_page_detailed_guide_on/)  
21. Google AntiGravity Agent Skills Just Changed How We Build With AI \- Reddit, accessed March 2, 2026, [https://www.reddit.com/r/AISEOInsider/comments/1qk14rk/google\_antigravity\_agent\_skills\_just\_changed\_how/](https://www.reddit.com/r/AISEOInsider/comments/1qk14rk/google_antigravity_agent_skills_just_changed_how/)  
22. antigravity-awesome-skills/README.md at main · sickn33 ... \- GitHub, accessed March 2, 2026, [https://github.com/sickn33/antigravity-awesome-skills/blob/main/README.md](https://github.com/sickn33/antigravity-awesome-skills/blob/main/README.md)  
23. GitHub \- guanyang/antigravity-skills: Empower agents with professional capabilities in specific fields (such as full-stack development, complex logic planning, multimedia processing, etc.) through modular Skills definitions, allowing agents to solve complex problems systematically like human experts., accessed March 2, 2026, [https://github.com/guanyang/antigravity-skills](https://github.com/guanyang/antigravity-skills)  
24. Google Antigravity Tutorial for Beginners: Build Your First App (Step-by-Step), accessed March 2, 2026, [https://www.youtube.com/watch?v=-0Irz8G0PEE](https://www.youtube.com/watch?v=-0Irz8G0PEE)  
25. Embedded Software Developers: What Do Your SKILL.md and WORKFLOW.md Files Look Like? \- Reddit, accessed March 2, 2026, [https://www.reddit.com/r/embedded/comments/1revdx8/embedded\_software\_developers\_what\_do\_your\_skillmd/](https://www.reddit.com/r/embedded/comments/1revdx8/embedded_software_developers_what_do_your_skillmd/)  
26. Skills Made Easy with Google Antigravity and Gemini CLI | by Karl ..., accessed March 2, 2026, [https://medium.com/google-cloud/skills-made-easy-with-google-antigravity-and-gemini-cli-5435139b0af8](https://medium.com/google-cloud/skills-made-easy-with-google-antigravity-and-gemini-cli-5435139b0af8)  
27. How do you create skills with AG? : r/google\_antigravity \- Reddit, accessed March 2, 2026, [https://www.reddit.com/r/google\_antigravity/comments/1qg177z/how\_do\_you\_create\_skills\_with\_ag/](https://www.reddit.com/r/google_antigravity/comments/1qg177z/how_do_you_create_skills_with_ag/)  
28. The SKILL.md Pattern: How to Write AI Agent Skills That Actually Work | by Bibek Poudel, accessed March 2, 2026, [https://bibek-poudel.medium.com/the-skill-md-pattern-how-to-write-ai-agent-skills-that-actually-work-72a3169dd7ee](https://bibek-poudel.medium.com/the-skill-md-pattern-how-to-write-ai-agent-skills-that-actually-work-72a3169dd7ee)  
29. skills/skills/skill-creator/SKILL.md at main · anthropics/skills · GitHub, accessed March 2, 2026, [https://github.com/anthropics/skills/blob/main/skills/skill-creator/SKILL.md](https://github.com/anthropics/skills/blob/main/skills/skill-creator/SKILL.md)  
30. Extend Claude with skills \- Claude Code Docs, accessed March 2, 2026, [https://code.claude.com/docs/en/skills](https://code.claude.com/docs/en/skills)