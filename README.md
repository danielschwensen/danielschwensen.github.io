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

## 🛠️ Features
- **Tag Cloud**: Dynamic overview of all topics
- **Search**: Client-side search via JavaScript
- **Theme**: Custom Minima with SCSS adjustments
