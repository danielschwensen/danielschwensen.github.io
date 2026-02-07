[https://danielschwensen.github.io](https://danielschwensen.github.io)

A personal blog about PowerShell, AWS, Linux, and more.

## 🚀 Development

### Update Search
The search is based on a static `search.json`. After creating a new post, the index must be regenerated:

```powershell
.\scripts\generate-searchjson.ps1
```

### Local Testing
```bash
bundle exec jekyll serve
```

## 🛠️ Features
- **Tag Cloud**: Dynamic overview of all topics
- **Search**: Client-side search via JavaScript
- **Theme**: Custom Minima with SCSS adjustments