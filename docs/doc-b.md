# Document B

A second test file, so the cross-file links in Document A have a real target.

Every link below works correctly on GitHub. The links under **Broken in
Visual Studio** do *not* work in Visual Studio's markdown preview.

## Links that work everywhere

- [Open Document A](doc-a.md) — relative link to another file, **no anchor**
- [Jump to Section One](#section-one) — same-file anchor to a plain-text heading
- [Jump to Section Two](#section-two) — same-file anchor to a plain-text heading

## Links broken in Visual Studio

- [Document A, "1. Something"](doc-a.md#1-something) — cross-file link to a heading in another file
- [Document A, "2. Something else"](doc-a.md#2-something-else) — cross-file link to a heading in another file

<!-- filler so a working jump produces a visible scroll -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

## Section One

A plain-text heading. Its same-file anchor `#section-one` works in Visual
Studio, but the cross-file link `doc-b.md#section-one` from Document A does not.

<!-- filler -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

## Section Two

Another plain-text heading. Its same-file anchor `#section-two` also works.
