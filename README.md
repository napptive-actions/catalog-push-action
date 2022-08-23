# CATALOG-PUSH-ACTION

This repo contains a github action that allows to upload an application into the Napptive catalog.

Napptive playground simplifies the process to depoy and maintenance cloud-native applications. [Try for free!!](https://playground.napptive.dev/login)

## What is Napptive Catalog

Napptive catalog contains a collection of applications ready to be deployed. The applications in the catalog are available to all users of the platform.

## References

* [Catalog documentation](https://docs.napptive.com/Catalog.html)
* [Catalog repository](https://github.com/napptive/catalog-manager)

## Environment variable

### `PLAYGROUND_PAT`

This environment variable contains a [Napptive Personal Access Token]((https://docs.napptive.com/guides/Using_personal_access_tokens.html)) used to login to the platform.

## Inputs

### `applicationPath`

The path that contains the yaml files of the application to be uploaded.

### `namespace`

The namespace where the application is going to be udpated. The applications within the catalog are organized in different namespaces. You can upload apps to your account namespace. The application will be named following the following notation *`namespace/appName:tag`*.

### `applicationName`

With the application name. In Napptive Catalog, the name of the application follows the following convention: *`namespace/appName:tag`*

### `tag`

With the application tag. This input is __required__, __latest__ by default.

The Application in Napptive Catalog will be named as *`namespace/appName:tag`*

### `playgroundConfigFile`

To use a custom YAML file to change the target playground installation. No __required__
This file contains a playground installation configuration. Visit [documentation](https://docs.napptive.com/playground/On_premise_configuration.html#configuration-file) for an example.

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
      - uses: napptive-actions/catalog-push-action@v3.1.0
        env:
          PLAYGROUND_PAT: ${{ secrets.PLAYGROUND_PAT }}
        with:
          applicationPath: ./app/
          namespace: "napptive"
          applicationName: "drawio"
          tag: "14.3.0"

```

## License

Copyright 2020 Napptive

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.

You may obtain a copy of the License at:

[https://www.apache.org/licenses/LICENSE-2.0](https://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

See the License for the specific language governing permissions and limitations under the License.