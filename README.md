[https://danielschwensen.github.io](https://danielschwensen.github.io)

A personal blog about PowerShell, AWS, Linux, and more.

## 🚀 Development

### Search and publishing
`search.json` is a Jekyll/Liquid template, not a manually maintained JSON file.
GitHub Pages generates the JSON index automatically when it builds the site.
The index uses Jekyll's published posts, article URLs, dates, categories, tags,
and article text. New, edited, or removed posts are reflected in the next build.

Work on a branch, commit and push the changes, then open a pull request to
`master`. The **Check search index** workflow builds the site using GitHub's
Pages build action and checks the generated `_site/search.json`. It verifies
the JSON structure, unique URLs, completeness against the homepage's post list,
article files and dates, and categories/tags against the source metadata.
The check currently assumes all posts are directly under `_posts` and that the
homepage lists all posts without pagination. Failures appear in the pull request
checks and the Actions log, with the affected URL and reason.

This workflow only checks the site; it does not publish it. Publishing still
uses **Settings → Pages → Deploy from a branch → master**. Merge after the
checks pass, then test the search on the published website.

No local Jekyll installation or manual index generation is required.
If you already have a local Jekyll environment, you can optionally run:

```bash
bundle exec jekyll build
ruby scripts/check-search-index.rb _site
```

### Search library version

`search.html` loads **Simple-Jekyll-Search 1.10.0** from unpkg using an exact
version URL. The library searches the generated index in the visitor's browser;
it is separate from the GitHub Pages index build.
Source: [Simple-Jekyll-Search](https://github.com/christian-fei/Simple-Jekyll-Search).

To update the library deliberately:

1. Check the upstream release notes and published package version.
2. Create a branch and replace the version number in the script URL in
   `search.html`. Use an exact version, never `@latest`.
3. Open a pull request and wait for the GitHub Pages build check to pass.
4. After merging, test title, content, date, category and tag searches on the
   published Search page, including a query with no results. Also test a Search
   link containing `?q=PowerShell`; query initialization is tracked in issue #15.
5. If search breaks, revert the update through a pull request.

## 🛠️ Features
- **Tag Cloud**: Dynamic overview of all topics
- **Search**: Client-side search via JavaScript
- **Theme**: Custom Minima with SCSS adjustments
