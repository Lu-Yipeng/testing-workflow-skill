# testing-workflow-skill

A reusable testing governance skill for AI coding agents.

This repository packages a practical, risk-driven testing workflow that helps an agent decide:

- what to test
- why it needs to be tested
- how deep the validation should go
- when multi-agent collaboration is worth using
- how to record evidence, residual risk, and bad cases

It is designed for post-development validation, regression planning, feature acceptance, release confidence checks, and structured QA handoff.

## What This Is

`testing-workflow-skill` is a **general testing workflow skill**, not a project-specific test suite.

It gives an agent:

- a six-step testing workflow
- decision rules
- risk modeling guidance
- output conventions
- multi-agent collaboration guidance
- reusable templates and helper scripts

## What This Is Not

This repository does **not** provide:

- your project's exact test commands
- your environment topology
- your business-specific assertions
- your seed accounts or deployment addresses

Those should live in your **project-level skill**, repo docs, or team QA playbooks.

In short:

- this repo defines **how to organize testing**
- your project defines **how testing is executed concretely**

## Core Ideas

This skill is built around a few opinions:

1. Test depth should be driven by risk, not by convenience.
2. Public benchmarks are useful as baselines, but they should not become the optimization target.
3. Pure exploratory testing is not a reliable default execution path.
4. Production and test-environment bad cases are more valuable than vanity scores.
5. PRD is the main starting point when it exists, but it is not the only fact source.
6. When PRD, code, and runtime behavior conflict, the conflict itself must be recorded explicitly.

## Design Principles

- **Bad-case-driven evolution**  
  Real bad cases are not just failures to archive. They are the main fuel for capability growth.

- **Stage-aware engineering compensation**  
  When full autonomy is not stable enough, guided paths, domain knowledge, and explicit boundaries are valid engineering choices.

- **Real business over benchmark chasing**  
  Benchmarks provide a baseline. Real workflow success determines whether the capability is actually useful.

## The Six-Step Workflow

1. Intent Identification
2. Impact Analysis
3. Risk Modeling
4. Path Planning
5. Precise Execution
6. Evaluation and Knowledge Capture

The canonical instructions live in [SKILL.md](./SKILL.md).

## What Makes This Skill Useful

This repo tries to cover the testing questions that usually get hand-waved away:

- If there is a PRD, how do we turn it into test tasks?
- If there is no complete PRD, how do we infer scope from code, pages, and historical behavior?
- If PRD, implementation, and runtime behavior conflict, how do we judge and document it?
- When should we use two agents instead of one?
- How do we avoid turning testing into unbounded exploration?
- How do we turn recurring failures into reusable regression assets?

## Repository Structure

```text
.
├── SKILL.md
├── agents/
│   └── openai.yaml
├── references/
│   ├── workflow.md
│   ├── risk-model.md
│   ├── multi-agent.md
│   ├── anti-patterns.md
│   ├── decision-tables.md
│   ├── output-templates.md
│   ├── file-templates.md
│   ├── project-integration.md
│   ├── bad-case-loop.md
│   ├── term-mapping.md
│   ├── eval.md
│   ├── artifact-retention.md
│   └── examples.md
└── scripts/
    ├── init_test_round.sh
    └── write_handoff_template.sh
```

## Installation

### Option 1: clone directly into Codex skills

```bash
git clone https://github.com/Lu-Yipeng/testing-workflow-skill.git ~/.codex/skills/testing-workflow
```

### Option 2: keep the repo elsewhere and symlink it

```bash
git clone https://github.com/Lu-Yipeng/testing-workflow-skill.git ~/project/testing-workflow-skill
ln -s ~/project/testing-workflow-skill ~/.codex/skills/testing-workflow
```

After that, Codex can discover the skill from:

```text
~/.codex/skills/testing-workflow
```

## How To Use It

Use this skill when the task is about:

- testing strategy
- regression planning
- QA workflow
- acceptance validation
- feature-complete post-dev verification
- building a reusable quality process

Typical agent flow:

1. Read [SKILL.md](./SKILL.md)
2. Read the essential references:
   - [workflow.md](./references/workflow.md)
   - [risk-model.md](./references/risk-model.md)
   - [anti-patterns.md](./references/anti-patterns.md)
3. If needed, read:
   - [decision-tables.md](./references/decision-tables.md)
   - [multi-agent.md](./references/multi-agent.md)
   - [output-templates.md](./references/output-templates.md)
   - [project-integration.md](./references/project-integration.md)
4. Initialize a test round and write artifacts into `testing-artifacts/<task-id>/<round-id>/`

## Helper Scripts

### Initialize a full test round skeleton

```bash
sh scripts/init_test_round.sh <task-id> <round-id>
```

This creates:

```text
testing-artifacts/<task-id>/<round-id>/
  01-intent.md
  02-impact.md
  03-risk.md
  04-plan.md
  05-execution.md
  06-eval.md
  07-knowledge-capture.md
  planner-handoff.md
  executor-report.md
```

### Write only the planner/executor handoff files

```bash
sh scripts/write_handoff_template.sh <task-id> <round-id>
```

## Recommended Project Integration

This skill works best in a two-layer model:

### Global skill responsibilities

- method
- flow
- decision rules
- output protocol
- multi-agent collaboration rules

### Project skill responsibilities

- exact commands
- environment rules
- system-specific risk chains
- golden assertions
- regression packs
- environment maintenance boundaries

See [references/project-integration.md](./references/project-integration.md).

## Output Protocol

Each formal test round should write artifacts like this:

```text
testing-artifacts/
  <task-id>/
    <round-id>/
      01-intent.md
      02-impact.md
      03-risk.md
      04-plan.md
      05-execution.md
      06-eval.md
      07-knowledge-capture.md
      planner-handoff.md
      executor-report.md
```

This is one of the most important parts of the skill: testing should leave behind reusable structure, not just chat history.

## Multi-Agent Guidance

This repo assumes multi-agent testing is useful only when it actually helps.

Recommended default split:

- `Planner Agent`: intent, impact, risk, planning
- `Executor Agent`: validation, evidence capture, execution summary

Do not use multiple agents just for theater. Use them when scope, speed, or separation of concerns makes it worthwhile.

See [references/multi-agent.md](./references/multi-agent.md).

## Handling PRD, Code, and Runtime Conflict

This repo explicitly treats three fact sources as different things:

- PRD: intended behavior
- code: implemented behavior
- runtime: actual observed behavior

When they conflict, the test result should not hide that conflict. It should record:

- what PRD says
- what code currently does
- what the environment actually shows
- which source is treated as the temporary truth for this round
- whether the mismatch is likely a stale doc, implementation gap, or environment drift

This is documented in:

- [references/workflow.md](./references/workflow.md)
- [references/decision-tables.md](./references/decision-tables.md)
- [references/output-templates.md](./references/output-templates.md)

## Anti-Patterns

This skill intentionally pushes against a few common mistakes:

- optimizing for benchmark score instead of real bad cases
- using exploratory testing as the main validation path for high-risk flows
- skipping risk modeling and jumping straight into commands
- mixing environment repair with business acceptance
- treating PRD as the only truth
- treating current code as the only truth
- running multiple agents that duplicate each other's work

See [references/anti-patterns.md](./references/anti-patterns.md).

## Language Note

The current skill content is written primarily in Chinese because it was created for Chinese-speaking workflows first.

That is intentional, but the structure is general and can be adapted into an English-first variant later without changing the core design.

## Suggested Next Step

If you want to use this seriously, do not stop at installing the global skill.
Pair it with a project-level testing skill that defines:

- your concrete commands
- your environment boundaries
- your main risk flows
- your real regression assets

Without that second layer, a testing workflow stays generic. With it, the workflow becomes operational.
