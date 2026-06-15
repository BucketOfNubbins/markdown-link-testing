# Document B — cross-document link behavior

In Visual Studio's markdown preview, a link that contains a `#fragment` is
resolved against the **current** document; the file path in the link is ignored.
A link with no fragment is the only kind that navigates to another file.

- `path` (no fragment) → Visual Studio opens that file.
- `path#fragment` → Visual Studio ignores `path` and looks for `#fragment` in the
  current file:
  - if the current file has a heading with that id, the view jumps to it — even
    when `path` names a different file, or a file that does not exist;
  - if it does not, nothing happens.

On GitHub the file path is honored, so these links behave differently there.

## The file path is ignored

Only this document contains a heading whose id is `section-one`. Every link below
points at `section-one`, and every one of them jumps to
[Section One](#section-one) in this document:

- [doc-a.md#section-one](doc-a.md#section-one) — names a different file
- [no-such-file.md#section-one](no-such-file.md#section-one) — names a file that does not exist
- [doc-b.md#section-one](doc-b.md#section-one) — names this file
- [#section-one](#section-one) — no file, a plain same-file anchor

All four behave identically, which shows the file path has no effect.

## Fragments that are absent from this document

These links name real headings in Document A, but this document has no heading
with a matching id. Because Visual Studio searches only the current file, each
one does nothing — it does not open Document A.

- [doc-a.md#plain-heading](doc-a.md#plain-heading)
- [doc-a.md#chapter-3-summary](doc-a.md#chapter-3-summary)
- [doc-a.md#manual-anchor](doc-a.md#manual-anchor)

The link format does not change this. A leading `./` or an absolute `/docs/…`
path, a raw HTML `<a href="doc-a.md#…">`, and line-number fragments such as `#L94`
or `#L94:1` all behave the same way.

## The only link that opens another file

- [Open Document A](doc-a.md) — no fragment, so Visual Studio honors the path and
  opens Document A.

<!-- filler so a working jump produces a visible scroll -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

## Section One

A plain-text heading. Any fragment link that resolves to `#section-one` lands
here, regardless of the file named in the link, because Visual Studio ignores the
file path and matches the fragment within this document.
