# Document A

A test file for Visual Studio's markdown link handling.

Every link below works correctly on GitHub. The links under **Broken in
Visual Studio** do *not* work in Visual Studio's markdown preview.

## Links that work everywhere

- [Open Document B](doc-b.md) — relative link to another file, **no anchor**

## Links broken in Visual Studio

- [Document B, Section One](doc-b.md#section-one) — cross-file link to a heading in another file
- [Jump to "1. Something"](#1-something) — same-file anchor; **heading starts with a number**
- [Jump to "2. Something else"](#2-something-else) — same-file anchor; **heading starts with a number**

> Note: `#section-one` works as a same-file anchor inside Document B, yet the
> cross-file form `doc-b.md#section-one` above is broken — so the breakage is
> about *cross-file* anchors, not the anchor itself.

<!-- filler so a working jump produces a visible scroll -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

## 1. Something

A heading whose text begins with a number. Its GitHub anchor is
`#1-something`; Visual Studio fails to navigate to it.

<!-- filler -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

## 2. Something else

Another numbered heading. Its GitHub anchor is `#2-something-else`.
