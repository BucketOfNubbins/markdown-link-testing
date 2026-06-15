# Document A — same-file anchor tests

This file tests how Visual Studio's markdown preview resolves **same-file**
anchor links (`#heading`), and how that differs from GitHub.

Both engines build a heading's id by lowercasing the text and turning spaces
into hyphens. They diverge on two rules, and those divergences are exactly what
break links that work fine on GitHub:

| Heading | GitHub id | Visual Studio id (observed) | Match? |
|---------|-----------|------------------|--------|
| `## Plain Heading` | `plain-heading` | `plain-heading` | ✅ |
| `## Chapter 3 Summary` | `chapter-3-summary` | `chapter-3-summary` | ✅ number mid-title is kept by both |
| `## 5 Reasons` | `5-reasons` | `reasons` | ❌ VS discards a **leading** number |
| `## Version 2.0 Notes` | `version-20-notes` | `version-2.0-notes` | ❌ GitHub removes the `.`, VS keeps it |
| `## 1. Leading Number` | `1-leading-number` | `leading-number` | ❌ leading number **and** dot dropped |

The two divergences:

- **A leading number is dropped** in the Visual Studio id, while a number in the
  *middle* of a title is kept by both engines.
- **A dot is removed by GitHub but kept by Visual Studio**
  (`## Version 2.0 Notes` → `version-20-notes` vs `version-2.0-notes`).

We don't have access to Visual Studio's internals, so the "Visual Studio id"
column reflects the ids it *appears* to generate, inferred from which anchors
actually resolve. The [Markdig](https://github.com/xoofx/markdig) parser, run
with its default (non-GitHub) options, reproduces every result below exactly, so
we use it as a model — but this is a presumption, not confirmation that Visual
Studio uses Markdig.

Every link below uses the **GitHub** anchor, so all of them work on GitHub. The
ones under *Broken in Visual Studio* are dead in VS because VS produces a
different id.

## Works in both

- [Plain Heading](#plain-heading) — no digits or punctuation
- [Chapter 3 Summary](#chapter-3-summary) — number in the **middle** of the title

## Broken in Visual Studio — leading number discarded

- [5 Reasons](#5-reasons) — GitHub anchor; dead in VS, whose id is `reasons`
- [1. Leading Number](#1-leading-number) — GitHub anchor; dead in VS, whose id is `leading-number`

## Broken in Visual Studio — dot in the title

- [Version 2.0 Notes](#version-20-notes) — GitHub anchor; dead in VS, whose id keeps the dot (`version-2.0-notes`)

## The anchors Visual Studio would accept (these are dead on GitHub)

These use VS's id, so they jump correctly **in Visual Studio** but are dead **on
GitHub** — proof that no single anchor satisfies both engines:

- [5 Reasons, VS-style](#reasons)
- [1. Leading Number, VS-style](#leading-number)
- [Version 2.0 Notes, VS-style](#version-2.0-notes)

<!-- filler so a working jump produces a visible scroll -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

## Plain Heading

Plain text, no digits or punctuation. Id is `plain-heading` in both engines, so
its anchor works everywhere.

<!-- filler -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

## Chapter 3 Summary

The `3` sits in the middle of the title, so both engines keep it:
`chapter-3-summary`.

<!-- filler -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

## 5 Reasons

Starts with a number. GitHub keeps it (`5-reasons`); the id Visual Studio
appears to use is `reasons`, with the leading number dropped.

<!-- filler -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

## Version 2.0 Notes

Contains a dot. GitHub removes it (`version-20-notes`); the id Visual Studio
appears to use keeps it (`version-2.0-notes`).

<!-- filler -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

## 1. Leading Number

The original failure mode — a leading number *and* a dot. GitHub →
`1-leading-number`; Visual Studio → `leading-number`.

<!-- filler -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<a id="manual-anchor"></a>

## Manual Anchor Target

Preceded by an explicit `<a id="manual-anchor"></a>`. Used by Document B to test
whether VS will follow a cross-file link to a hand-authored HTML anchor
(`doc-a.md#manual-anchor`).
