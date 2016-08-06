# Git to Markdown

Writes an article in Markdown from a Git repository.

Current behavior (subject to enhancement):

- Each section title is made of the commit first line.
- Commit message is ignored (except the first line).
- Revisions appear from the oldest to the newest.
- Only Java files are printed.
- The complete Java file is printed (including package, import, etc.).
- Each revision prints all files (not only changed files).
