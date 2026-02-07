# My Personal Notes - Daniel Schwensen

[https://danielschwensen.github.io](https://danielschwensen.github.io)

Ein persönlicher Tech-Blog über PowerShell, AWS, Linux und mehr.

## 🚀 Entwicklung

### Suche aktualisieren
Die Suche basiert auf einer statischen `search.json`. Nach dem Erstellen eines neuen Posts muss der Index neu generiert werden:

```powershell
.\scripts\generate-searchjson.ps1
```

### Lokales Testen
```bash
bundle exec jekyll serve
```

## 🛠️ Features
- **Tag Cloud**: Dynamische Übersicht aller Themen
- **Suche**: Client-seitige Suche via Javascript
- **Theme**: Custom Minima mit SCSS Anpassungen