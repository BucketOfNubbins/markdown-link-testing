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

Reproduced in **Visual Studio 2022** and **Visual Studio 2026**.

## Opening in Visual Studio

No generators or extra build tools are required — the Visual Studio solution is
checked in. Just open it from the project root:

```powershell
start MarkdownLinkTesting.sln
```

or double-click `MarkdownLinkTesting.sln` in File Explorer.

The two markdown files (and this README) are included in the solution, so you
can open them from Solution Explorer and click the links directly.

> If Visual Studio offers to retarget the project to a newer platform toolset or
> Windows SDK, you can accept or ignore it — the project is only a hello-world
> program and does not need to build to demonstrate the issue.
