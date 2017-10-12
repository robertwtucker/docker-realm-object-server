# Docker Realm Object Server
![docker build](https://img.shields.io/docker/automated/robertwtucker/realm-object-server.svg)

Docker container for the Realm Object Server (Developer Edition) -- part of the [Realm Mobile Platform](https://realm.io/products/realm-mobile-platform/).

## Supported tags and respective `Dockerfile` links

* [`1.8.3-83`, `latest` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/master/Dockerfile)
* [`1.8.2-310` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/1.8.2-310/Dockerfile)
* [`1.8.1-149` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/1.8.1-149/Dockerfile)
* [`1.7.6-62` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/1.7.6-62/Dockerfile)
* [`1.7.5-180` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/1.7.5-180/Dockerfile)
* [`1.7.4-5` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/1.7.4-5/Dockerfile)
* [`1.7.2-43` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/1.7.2-43/Dockerfile)
* [`1.7.1-41` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/1.7.1-41/Dockerfile)
* [`1.7.0-38` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/1.7.0-38/Dockerfile)
* [`1.6.1-37` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/1.6.1-37/Dockerfile)
* [`1.6.0-35` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/1.6.0-35/Dockerfile)
* [`1.5.0-318` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/1.5.0-318/Dockerfile)
* [`1.4.1-305` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/1.4.1-305/Dockerfile)
* [`1.3.0-294` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/1.3.0-294/Dockerfile)
* [`1.2.1-270` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/1.2.1-270/Dockerfile)
* [`1.1.0-257` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/1.1.0-257/Dockerfile)
* [`1.0.3-231` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/1.0.3-231/Dockerfile)
* [`1.0.2-205` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/1.0.2-205/Dockerfile)
* [`1.0.0-164` (*Dockerfile*)](https://github.com/robertwtucker/docker-realm-object-server/blob/1.0.0-164/Dockerfile)

## How to use this image

### Command Line:

```console
docker run -d -p 9080:9080 \
  -v $PWD/data:/var/lib/realm/object-server \
  robertwtucker/realm-object-server
```

### Docker Compose:

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

## Important Note

For any use beyond a simple test installation, it is highly recommended that the default public/private key pair and admin token be replaced. To do this:

1. Create a directory on the host that contains the ```configuration.yml``` and key files. For this example, we'll use a directory named ```config``` with the files ```realm-key.pem``` and ```realm-key.pub``` (private and public keys, respectively).

2. Edit the ```configuration.yml``` file and update the ```auth``` settings to use the new keys:

```console
auth:
  public_key_path: /etc/realm/realm-key.pub
  private_key_path: /etc/realm/realm-key.pem
```

3. Map the ```config``` directory to ```/etc/realm``` while running the ```realm-generate-admin-token``` command to generate the new admin token.

```console
docker run -v $PWD/config:/etc/realm \
  -v $PWD/data:/var/lib/realm/object-server \
  robertwtucker/realm-object-server \
  realm-generate-admin-token -k /etc/realm/realm-key.pem
```

The token file, ```admin_token.base64```, will be written to ```/etc/realm``` (AKA our mapped ```config``` directory). Be sure to map the ```config``` directory in all subsequent launches of the container.

## Licensing

This Dockerfile/image is provided under the terms of the [MIT License](https://github.com/robertwtucker/docker-realm-object-server/blob/master/LICENSE).

Software contained in this image is licensed as follows:

* Realm Object Server: [Developer License Terms](https://realm.io/legal/developer-license-terms/)

## Issues

If you have any problems with or questions about this image, please open a [GitHub issue](https://github.com/robertwtucker/docker-realm-object-server/issues).
