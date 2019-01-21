# Dockerized Open Lighting Architecture

[![Build Status](https://travis-ci.org/bartfeenstra/docker-ola.svg?branch=master)](https://travis-ci.org/bartfeenstra/docker-ola)

## Usage

### Configuration
OLA's configuration directory is located at `/usr/lib/olad/.ola`, and configuration files can be copied or mounted
there.

### Customizing the `olad` invocation
To exercise full control over OLA's behavior, set the entry point to `olad` and use the image's Docker command (`CMD` in
Dockerfile, `COMMAND` for `docker run`) to pass on additional arguments. Run `olad --help` to see the full list of 
available options. Example: to change the default HTTP port from `9090` to `9091`, run
`docker run -d --entrypoint olad bartfeenstra/ola --http-port 9091`.
