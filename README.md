# dockerized-github-runner

## Usage

### Basic usage
Use the following command to start listening for jobs:
```shell
docker run -it --name gh_runner \
    -e GH_RUNNER_NAME=###### \
    -e GH_RUNNER_TOKEN=###### \
    -e GH_RUNNER_URL=https://github.com/### \
    ghcr.io/pascal13ch/dockerized-github-runner:v1.0.0
```

### Using docker-compose.yml

In `docker-compose.yml` :
```yaml
version: "3.7"

services:
    runner:
      image: ghcr.io/pascal13ch/dockerized-github-runner:v1.0.0
      environment:
        GH_RUNNER_NAME: #######
        GH_RUNNER_URL: https://github.com/###
        GH_RUNNER_TOKEN: #########
      volumes:
        - /var/run/docker.sock:/var/run/docker.sock
```

## Runner Token

You can find this tokens in the Actions Settings page (add runner)


## Environment variables

The following environment variables allows you to control the configuration parameters.

| Name | Description | Required |
|------|---------------|-------------|
| GH_RUNNER_NAME | Runner name  | Yes |
| GH_RUNNER_URL | Private / Organization Repo URL | Yes |
| GH_RUNNER_TOKEN | Runner token Can be found in the Actions Page (add runner).  | Yes |
| GH_RUNNER_LABELS | Extra labels | _No_ |

