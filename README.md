# Sample Api

Quick C# API Example, built and run on a Docker container.

### Build with Docker

    docker build -t <image-name> .
    docker create -p 5229:80 --name <container-name> <image-name>
