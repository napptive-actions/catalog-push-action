# CATALOG-PUSH-ACTION

This repo contains a github action that allows to upload an application into Napptive catalog.

## Environment variable

### `PLAYGROUND_PAT`

This environment variable contains a Napptive Personal Access Token. Visit [Napptive documentation](https://docs.napptive.com/guides/Using_personal_access_tokens.html) to know how to create it.

## Inputs

### `applicationPath`

The path where the files of the application to be uploaded are. Please, review documentation to understand the applications in [Napptive Catalog](https://docs.napptive.com/catalog/The_application_catalog.html)

### `namespace`

The namespace where the application is going to be udpated.

### `applicationName`

With the application name.

### `tag`

With the application version. This input is __required__, __latest__ by default.

The Application in Napptive Catalog will be named as `namespace/appName:tag`

## Example usage

```bashname: Push a new version into the Napptive Playground Catalog
on: [push]
jobs:
  deploy:
    name: Upload new version to the catalog
    runs-on: ubuntu-latest
    steps:
      # Get a copy of the repo.
      - uses: actions/checkout@v2
      # Push a new version of the application
      - uses: napptive-actions/playground-catalog-push@master
        env:
          PLAYGROUND_PAT: ${{ secrets.PLAYGROUND_PAT }}
        with:
          applicationName: ./app/
          namespace: "napptive"
          application_name: "drawio"
          tag: "14.3.0"

```

## License

Copyright 2020 Napptive

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.

You may obtain a copy of the License at:

[https://www.apache.org/licenses/LICENSE-2.0](https://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

See the License for the specific language governing permissions and limitations under the License.