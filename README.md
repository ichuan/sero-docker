# sero-docker
Dockerfile for sero


# Building

```bash
docker build -t sero .
```

# Running

```bash
# block dir
mkdir data
docker run --rm -itd --name sero -p 8545:8545 -v `pwd`/data:/root/.sero sero
```

# Using pre-built docker image

Using automated build image from <https://hub.docker.com/r/mixhq/sero/>:

```bash
docker run --rm -itd --name sero -p 8545:8545 -v `pwd`/data:/root/.sero mixhq/sero
```
