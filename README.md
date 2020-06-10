# SEA-MAP Tech vs. Abuse project

### Site URLs
- [Alpha](http://neontribe.github.io/sea-map)

### Development 

## Prerequisites
- [elm](http://elm-lang.org/) 0.19
- [node](https://nodejs.org/)
- [nvm for macOS & Linux](https://github.com/nvm-sh/nvm)
- [nvm for Windows](https://github.com/coreybutler/nvm-windows)
- [Parcel](https:://parceljs.org)

## Develop
- `npm start` for a hot-reload dev server

## Test
- `npm test` to run `elm-test`

## Build
- `npm run build` to bundle app to `dist` dir

### Deploy to GitHub pages with Travis
We're using [Travis](https://travis-ci.org).
- On every push to the repo, Travis will build and run tests
- To trigger a deploy to gh-pages, create and push a tag (e.g. `git tag v1.0.0 && git push origin --tags`
Encrypted vars can be added to `.travis.yml` using the travis cli tools as decribed in the [travis docs](https://docs.travis-ci.com/user/encryption-keys/#usage).
Currently configured with GITHUB_TOKEN value.
