# Document B — cross-document link tests

This file focuses on **cross-file** anchor links (`other-file.md#heading`).

The finding: when a link points to a heading in *another* file, Visual Studio
opens the file but does **not** scroll to the heading — even when the anchor is
a plain heading whose id is identical on GitHub and in VS. So this is a
navigation gap that is **separate** from the heading-id differences shown in
[Document A](doc-a.md).

## Works in both

- [Open Document A](doc-a.md) — cross-file link with **no anchor**
- [Jump to Section One](#section-one) — **same-file** anchor in this file
- [Jump to Section Two](#section-two) — **same-file** anchor in this file

## Broken in Visual Studio — cross-file anchor not followed

Both targets are **plain** headings in Document A (`plain-heading`,
`chapter-3-summary`) whose ids are the *same* on GitHub and in VS, so the
heading-id difference is ruled out. These work on GitHub; in VS the file opens
but the view does not jump to the heading.

- [Document A → Plain Heading](doc-a.md#plain-heading)
- [Document A → Chapter 3 Summary](doc-a.md#chapter-3-summary)

Contrast this with the same-file links above: `#section-one` jumps correctly
*within* this file, yet a cross-file reference to the same kind of plain heading
does not. The only difference is crossing the file boundary, which isolates this
as a distinct bug from the slug issues in Document A.

<!-- filler so a working jump produces a visible scroll -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

## Section One

A plain-text heading. Its **same-file** anchor `#section-one` works in Visual
Studio; a **cross-file** link to it from another document does not.

<!-- filler -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

## Section Two

Another plain-text heading; `#section-two` works as a same-file anchor too.
