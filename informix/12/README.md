# Informix Docker Image

This repository contains the necessary files to build a Docker image for **IBM Informix**, including a `Dockerfile` and supporting resources.

## Legal Considerations

IBM **does not allow public redistribution of Informix binaries**. Therefore:

* This repository **does not include Informix binaries**.
* It only provides the `Dockerfile` and required resources to build the image.
* IBM does allow the use of its official registries and base images.

If you want to use this image, you must build it yourself.

## Building the Image

To use this image, each user must perform the build process locally.

### Requirements

* Docker installed
* Access to IBM registries (if required)
* Valid Informix license/entitlement

### Steps

1. Clone this repository or copy the folder

```bash
git clone <repo-url>
cd <repo-folder>
```

2. Build the Docker image

```bash
docker build -t informix-custom .
```

3. Verify the image was created successfully

```bash
docker images | grep informix-custom
```

## Usage

Once the image is built, you can run a container

```bash
docker run -d --name informix \
  -p <port>:<port> \
  -e LICENSE=accept \
  informix-custom
```

*Note*: You must explicitly accept the IBM Informix license when running the container.
Adjust ports, volumes, and environment variables as needed.

## Notes

* This project **does not distribute proprietary software**, it only facilitates deployment.
* Users are responsible for complying with IBM licensing terms.
* Refer to official Informix documentation for advanced configuration.

## License

This repository contains only container definitions and scripts.
The use of Informix is subject to IBM licensing terms.
