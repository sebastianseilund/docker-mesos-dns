# docker-mesos-dns

The purpose of this repo is to build and publish a Docker image to run new versions of mesos-dns. [The official Docker image](https://hub.docker.com/r/mesosphere/mesos-dns/) is outdated and no longer works with newer versions of Mesos.

The bin/mesos-dns file was downloaded from:
https://github.com/mesosphere/mesos-dns/releases/download/v0.4.0/mesos-dns-v0.4.0-linux-amd64.gz


## Usage

Run the container and mount the mesos-dns config.json file at `/config.json`.

`docker run` example:

```sh
docker run -v /path/to/config.json:/config.json sebastianseilund/mesos-dns  
```

Marathon app config example:

```js
{
  "id": "mesos-dns",
  "instances": 1,
  "cpus": 0.1,
  "mem": 64,
  "container": {
    "docker": {
      "type": "DOCKER",
      "image": "sebastianseilund/mesos-dns:latest",
      "network": "HOST"
    },
    "volumes": [
      {
        "hostPath": "/path/to/config.json",
        "containerPath": "/config.json",
        "mode": "RW"
      }
    ]
  }
}
```


## Testing that it works locally

First build it:

```sh
docker build -t sebastianseilund/mesos-dns .
```

Then run it and mount the test config.json file:

```sh
docker run -v /path/to/docker-mesos-dns/fixtures/config.json:/config.json sebastianseilund/mesos-dns  
```
