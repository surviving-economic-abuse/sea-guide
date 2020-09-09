# SEA-MAP Tech vs. Abuse project

## Site URLs

[![Netlify Status](https://api.netlify.com/api/v1/badges/7786cc97-9bfb-4b62-b8b6-b17f43d3dacc/deploy-status)](https://app.netlify.com/sites/sea-map/deploys)
- [Staging (deploy previews for each pull request)](https://app.netlify.com/sites/sea-map/deploys)
- [Release](https://sea-map.netlify.app)

## Development

### Prerequisites

- [elm](http://elm-lang.org/) 0.19
- [node](https://nodejs.org/)
- [nvm for macOS & Linux](https://github.com/nvm-sh/nvm) or [nvm for Windows](https://github.com/coreybutler/nvm-windows)
- [Parcel](https://parceljs.org)

### Formatting

We recommend integrating `elm-format@0.8.3` into your code editor, but if you don't...

- Please `npm run format` to format `.elm` files in `src` before committing code.

### Using images

We use plugin, [parcel asset copier](https://github.com/tiaanduplessis/parcel-plugin-asset-copier)
to copy everything from `src/images` to the root of the build. In order for image paths to
resolve from nested urls, please use a preceding `/` when `src`-ing them.

### Develop

- `npm start` for a hot-reload dev server at [http://localhost:1234](http://localhost:1234/)

### Test

- `npm test` to run `elm-test`

## Production

### Build

- `npm run build` to bundle app to `dist` dir

### Deploy to Netlify

We're using [Netlify](https://www.netlify.com).

- On every pull request raised against `release`, Netlify will build, run tests and deploy to preview
- On every merge to `release` Netlify will deploy to [sea-map.netlify.app](https://sea-map.netlify.app)
