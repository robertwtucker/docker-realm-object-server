# Docker Realm Object Server
![docker build](https://img.shields.io/docker/automated/robertwtucker/realm-object-server.svg)

Docker container for the Realm Object Server (Developer Edition) -- part of the [Realm Mobile Platform](https://realm.io/products/realm-mobile-platform/).

## Supported tags and respective `Dockerfile` links

* [`1.0.0-164`, `latest` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/master/Dockerfile)

## How to use this image

Command Line:

```console
docker run -d -v $PWD/data:/var/lib/realm/object-server -p 9080:9080 robertwtucker/realm-object-server
```

Docker Compose:

```console
realm:
  image: robertwtucker/realm-object-server
  container_name: realm
  volumes:
    - ./data:/var/lib/realm/object-server
    - ./configuration.yml:/etc/realm/configuration.yml
  ports:
    - "9080:9080"
```

## Licensing

This Dockerfile/image is provided under the terms of the [MIT License](https://github.com/robertwtucker/docker-realm-object-server/blob/master/LICENSE).

Software contained in this image is licensed as follows:

* Realm Object Server: [Developer License Terms](https://realm.io/legal/developer-license-terms/)

## Issues

If you have any problems with or questions about this image, please open a [GitHub issue](https://github.com/robertwtucker/docker-realm-object-server/issues).
