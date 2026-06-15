# Markdown Link Testing

A minimal C++ project used to reproduce Visual Studio's incorrect handling of
certain markdown links. The C++ side is just a hello-world program ([src/main.cpp](src/main.cpp));
the interesting part lives in [docs/](docs).

## The problem

[docs/doc-a.md](docs/doc-a.md) and [docs/doc-b.md](docs/doc-b.md) contain a set
of markdown links. **All of them work correctly on GitHub.** In Visual Studio's
markdown preview, two kinds of links are broken:

1. **Cross-file anchor links** ([docs/doc-b.md](docs/doc-b.md)) —
   `otherfile.md#heading`. When a link has a `#fragment`, Visual Studio **ignores
   the file path entirely** and resolves the fragment against the *current*
   document — it never navigates to the named file. So a "cross-file" link jumps
   only if the *current* file happens to contain that id (landing on the wrong
   file's heading), and otherwise does nothing. Only a plain `otherfile.md` link
   with **no** fragment actually crosses to another file. No format works around
   this; the file path is discarded whenever a fragment is present.
2. **Same-file anchors whose GitHub heading id differs from VS's**
   ([docs/doc-a.md](docs/doc-a.md)). VS's preview generates heading ids that are
   not GitHub-compatible, so a correct GitHub anchor finds nothing in VS. The
   two divergences:
   - A **leading number** is dropped by VS (`## 5 Reasons` → `reasons`, not
     `5-reasons`). A number in the *middle* of a title is fine in both.
   - A **dot** is removed by GitHub but kept by VS (`## Version 2.0 Notes` →
     `version-20-notes` on GitHub, `version-2.0-notes` in VS).

Presumed cause: we can't see Visual Studio's internals, but its preview behaves
exactly as the [Markdig](https://github.com/xoofx/markdig) parser does when run
**without** its `AutoIdentifierOptions.GitHub` option — every observed id is
reproduced that way. So VS *appears* to use a Markdig-like algorithm with
non-GitHub identifiers; this is inferred from behavior, not confirmation that VS
uses Markdig.

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
