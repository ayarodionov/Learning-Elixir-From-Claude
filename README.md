# Learning Elixir from Claude

A readable companion to the official Elixir documentation, written with Claude.

AI assistants write fluent Elixir. What they get wrong is quieter: code that compiles, reads well and passes the obvious test, then fails under load, on unexpected input, or in a release. This book teaches the concepts and mechanisms you need to spot it. Each chapter has the same shape:

1. **Why it exists**: the concept
2. **The building blocks**: the API, condensed
3. **How it actually works**: what the compiler and runtime do
4. **Plausible but wrong**: code that looks right and isn't, and the fix
5. **Review checklist and sources**

Facts are checked against the Elixir 1.20 documentation, and examples were run on a real Elixir installation. Runtime topics shared with Erlang (processes, memory, ETS, distribution, schedulers) are covered in the companion book, [Learning Erlang from Claude](https://github.com/ayarodionov/Learning-Erlang-from-Claude).

Start with the [Introduction](md/00-Introduction.md); when reviewing code, use the [Review Cheat Sheet](md/14-Review-Cheat-Sheet.md).

| # | Chapter | PDF | Markdown |
| --- | --- | --- | --- |
| 0 | Introduction | [pdf](pdf/00-Introduction.pdf) | [md](md/00-Introduction.md) |
| 1 | Pattern Matching and Data | [pdf](pdf/01-Pattern-Matching-and-Data.pdf) | [md](md/01-Pattern-Matching-and-Data.md) |
| 2 | Errors and Control Flow | [pdf](pdf/02-Errors-and-Control-Flow.pdf) | [md](md/02-Errors-and-Control-Flow.md) |
| 3 | Processes, Tasks and Agents | [pdf](pdf/03-Processes-Tasks-and-Agents.pdf) | [md](md/03-Processes-Tasks-and-Agents.md) |
| 4 | GenServer | [pdf](pdf/04-GenServer.pdf) | [md](md/04-GenServer.md) |
| 5 | Supervision and Registry | [pdf](pdf/05-Supervision-and-Registry.pdf) | [md](md/05-Supervision-and-Registry.md) |
| 6 | Enum, Stream and Collections | [pdf](pdf/06-Enum-Stream-and-Collections.pdf) | [md](md/06-Enum-Stream-and-Collections.md) |
| 7 | Strings and Unicode | [pdf](pdf/07-Strings-and-Unicode.pdf) | [md](md/07-Strings-and-Unicode.md) |
| 8 | Protocols and Behaviours | [pdf](pdf/08-Protocols-and-Behaviours.pdf) | [md](md/08-Protocols-and-Behaviours.md) |
| 9 | Macros | [pdf](pdf/09-Macros.pdf) | [md](md/09-Macros.md) |
| 10 | Mix, Configuration and Releases | [pdf](pdf/10-Mix-Config-and-Releases.pdf) | [md](md/10-Mix-Config-and-Releases.md) |
| 11 | Testing with ExUnit | [pdf](pdf/11-Testing-with-ExUnit.pdf) | [md](md/11-Testing-with-ExUnit.md) |
| 12 | Types | [pdf](pdf/12-Types.pdf) | [md](md/12-Types.md) |
| 13 | Observability | [pdf](pdf/13-Observability.pdf) | [md](md/13-Observability.md) |
| 14 | Review Cheat Sheet | [pdf](pdf/14-Review-Cheat-Sheet.pdf) | [md](md/14-Review-Cheat-Sheet.md) |

## Rebuilding the PDFs

Edit the Markdown in `md/`, then run `tools/build.sh` (all chapters) or `tools/build.sh md/01-Pattern-Matching-and-Data.md` (one chapter). It needs `pandoc` and Chromium or Chrome; set `CHROME=/path/to/chrome` if it isn't found automatically.
