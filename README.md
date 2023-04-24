# GitHub Action - Publish Gem to Rubygems

This is a GitHub Action written to automate the Ruby gem publication process. The action sets the Gem Credentials from `GITHUB_TOKEN` and `RUBYGEMS_API_KEY` environment variables, and then runs `rake release` in your project root. You can override this command by setting `RELEASE_COMMAND` environment variable to the script that creates and publishes (this is usually only the case when a repository hosts multiple gems together).

Inspired by https://github.com/cadwallion/publish-rubygems-action.

# Usage

```yaml
- uses: simplyqio/publish-rubygems-action@1.0.0
  env:
    # Required. Bundler requires this to release the gem.
    GITHUB_TOKEN: ''
    # Required. The RubyGems API Key associated with the account of the gem you wish to publish.
    #   You can generate a new API key at https://rubygems.org.
    RUBYGEMS_API_KEY: ''
    # Optional. Set the working directory to use for the action.
    WORKDIR: ''
    # Optional. Set this variable if you have a custom release command to be invoked.
    RELEASE_COMMAND: rake release
    # Optional. Set this to change the email of who signs the commit.
    GIT_COMMITTER_EMAIL: '<>'
    # Optional. Set this to change the name of who signs the commit.
    GIT_COMMITTER_NAME: 'GitHub Actions Bot'
```

# Example

```yml
name: Publish Gem

on:
  push:
    tags:
      - '*.*.*'
jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Release Gem
        uses: simplyqio/publish-rubygems-action@2.0.0
        env:
          GITHUB_TOKEN: ${{secrets.GITHUB_TOKEN}}
          RUBYGEMS_API_KEY: ${{secrets.RUBYGEMS_API_KEY}}
```
