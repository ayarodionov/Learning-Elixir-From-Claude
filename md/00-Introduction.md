---
title: "Introduction — A Readable Companion to the Elixir Docs"
subtitle: "Learning Elixir from Claude · checked against Elixir 1.20 · Sep 26, 2026"
---

## Why this book exists

AI assistants now write a large share of everyday Elixir. They are fluent in the syntax, the pipe operator and the standard library. What they get wrong is quieter: a `map[:key]` where a missing key should have failed loudly, a `GenServer` that exists only to group functions, a `Task.async` that takes its caller down with it, a config value frozen at compile time.

That code compiles, reads well, and passes the obvious test. It fails later, under load, on unexpected input, or in the release rather than in `iex`. You can only catch it if you know what the language and the runtime actually do.

This book is the Elixir half of a pair. Its companion, [*Learning Erlang from Claude*](https://github.com/ayarodionov/Learning-Erlang-from-Claude), covers the BEAM runtime itself: processes and mailboxes, binaries and memory, ETS, distribution, schedulers. Everything there applies to Elixir unchanged, so this book links to it instead of repeating it, and spends its pages on what Elixir adds.

## Where the material comes from

The Elixir documentation is unusually good. Beyond the API reference it includes guides and a set of official *anti-pattern* pages covering code, design, processes and macros. This companion reorganises that material around concepts, checks it against runnable code, and adds the section reference docs never have: code that looks right and isn't.

## How each chapter is built

1. **Why it exists.** The concept, and the problem it solves.
2. **The building blocks.** The API, condensed into tables.
3. **How it actually works.** What the compiler and runtime do underneath.
4. **Plausible but wrong.** Code that compiles and passes a happy-path test, why it fails, and the fix.
5. **Review checklist and sources.** What to check in real code, with links.

The "Plausible but wrong" section is the heart of each chapter. Its examples were run on a real Elixir installation wherever the behaviour could be shown in a script.

## How to read it

| Part | Chapters | Read when |
| --- | --- | --- |
| The language | 1 Pattern Matching and Data · 2 Errors and Control Flow | First |
| Concurrency | 3 Processes, Tasks and Agents · 4 GenServer · 5 Supervision and Registry | After part 1 |
| Working with data | 6 Enum, Stream and Collections · 7 Strings and Unicode · 8 Protocols and Behaviours | Any time after part 1 |
| Building projects | 9 Macros · 10 Mix, Config and Releases · 11 Testing with ExUnit · 12 Types | Before shipping |
| Running it | 13 Observability | In production |
| Reference | 14 Review Cheat Sheet | When reviewing code |

If you come from Erlang, chapter 12 of the Erlang book maps the two languages; start there, then read this book from chapter 1.

## Using it with an AI assistant

- **As a review list.** The cheat sheet collects every checklist. Run generated code past it before accepting it.
- **As a prompt.** Ask the assistant to check its code against a chapter's "Plausible but wrong" section, or to write the test that would expose a given failure.
- **As a check on the assistant.** When it claims something about how Elixir behaves, each chapter's sources show where to verify it.

## Conventions

- Facts were checked against the Elixir 1.20 documentation. Examples were run on Elixir 1.14 (OTP 24); where behaviour differs between versions, the text says so.
- Code examples are short and show one mistake each.
- "The Erlang book" means the companion *Learning Erlang from Claude*, cited by chapter number.

## A note on accuracy

This book was written with Claude, an AI assistant, and checked against the official documentation it cites. It can still contain mistakes. Treat the linked documentation as the authority, and please report errors as issues on the repository.
