# docker-realm-object-server
![docker build](https://img.shields.io/docker/automated/robertwtucker/realm-object-server.svg)

Docker container for the Realm Object Server

## Usage
Command Line:
```
docker run -d -v $PWD/data:/var/lib/realm/object-server -p 9080:9080 robertwtucker/realm-object-server
```

Docker Compose:
```
realm:
  image: robertwtucker/realm-object-server
  container_name: realm
  volumes:
    - ./data:/var/lib/realm/object-server
  ports:
    - "9080:9080"
```
