# Markdown Link Testing

A minimal C++ project used to reproduce Visual Studio's incorrect handling of
certain markdown links. The C++ side is just a hello-world program ([src/main.cpp](src/main.cpp));
the interesting part lives in [docs/](docs).

## The problem

[docs/doc-a.md](docs/doc-a.md) and [docs/doc-b.md](docs/doc-b.md) contain a set
of markdown links. **All of them work correctly on GitHub.** In Visual Studio's
markdown preview, two kinds of links are broken:

1. **Cross-file heading links** — `otherfile.md#heading`. Visual Studio opens
   the file but does not jump to the heading. Plain `otherfile.md` links (no
   anchor) work fine.
2. **Same-file anchors to headings that start with a number** — e.g.
   `#1-something` for a `## 1. Something` heading. Anchors to plain-text
   headings such as `#section-one` work fine.

Each link in the docs is labeled with what it tests and whether it works, so
you can click through them in Visual Studio and compare against GitHub.

## Prerequisites

- [premake5](https://premake.github.io/) on your `PATH`
- Visual Studio 2022 with the **Desktop development with C++** workload

## Generate and open in Visual Studio

From the project root:

```powershell
premake5 vs2022
```

This writes the solution to the `build\` folder. Open it with:

```powershell
start build\MarkdownLinkTesting.sln
```

The two markdown files are included in the solution (see the project's files in
Solution Explorer), so you can open them and click the links directly.

To target a different Visual Studio version, use the matching action, e.g.
`premake5 vs2019`.
