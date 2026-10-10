# Git installation article: image optimization

Issue: #23. Scope: `_posts/2023-12-03-Install_Git_Windows.md`.

## Size comparison

Sizes are file bytes, excluding HTTP headers and page resources.

| Image | PNG bytes | WebP bytes | Dimensions |
| --- | ---: | ---: | --- |
| Git-01 | 193564 | 109816 | 619 × 480 |
| Git-02 | 153860 | 90066 | 600 × 480 |
| Git-03 | 200762 | 118194 | 601 × 480 |
| Git-04 | 257278 | 154454 | 574 × 480 |
| Git-05 | 253456 | 152178 | 561 × 480 |
| Git-06 | 246057 | 148564 | 592 × 480 |
| Git-07 | 167590 | 99324 | 571 × 480 |
| Git-08 | 175704 | 103248 | 623 × 480 |
| Git-09 | 147088 | 85612 | 601 × 480 |
| Git-10 | 113956 | 67006 | 600 × 480 |
| **Total** | **1909315** | **1128462** | |

Reduction: **780853 bytes (40.9%)** for all ten images.

## Conversion and validation

Converted once with sharp 0.35.5: `keepMetadata().webp({ lossless: true, effort: 6 })`. Original PNG files remain as source assets; the article requests only the WebP files. No new build dependency is needed.

For all ten files, decoded RGBA buffers were compared before and after conversion and were identical. Dimensions and color profiles are preserved.

The first image loads eagerly. Images 2–10 use native lazy loading; browsers may fetch nearby images before they become visible. Explicit width and height reserve the aspect ratio before download. `max-width: 100%; height: auto` keeps images proportional on narrow screens.

## Browser checks after deployment

- Disable cache and use network throttling. Confirm that the article requests WebP files with successful responses.
- Scroll through the entire article and confirm that all ten images appear and text remains readable.
- Compare desktop and narrow mobile layouts; check for horizontal overflow and image distortion.
- Watch for layout shifts during delayed image loading.
- Compare total image transfer after scrolling through all images; initial transfer depends on viewport size and the browser's lazy-loading threshold.
