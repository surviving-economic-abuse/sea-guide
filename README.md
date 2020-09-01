# SEA-MAP Tech vs. Abuse project

## Site URLs

- [Staging (for Alpha)](http://neontribe.github.io/sea-map)

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

### Deploy to GitHub pages with Travis

We're using [Travis](https://travis-ci.org).

- On every push to the repo, Travis will build and run tests
- On every merge to `release` Travis will deploy to `gh-pages`
Encrypted vars can be added to `.travis.yml` using the travis cli tools as decribed in the [travis docs](https://docs.travis-ci.com/user/encryption-keys/#usage).
Currently configured with GITHUB_TOKEN value.
