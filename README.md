# inception

*A System Administration related exercise.*

## Table of Contents
- [The Challenge](#the-challenge)
- [Implementation](#implementation)
    - [Final Thoughts](#final-thoughts)
- [Examples](#examples)
- [Installation](#installation)

## The Challenge
This project focuses on system administration using Docker.  The purpose is to create a WordPress website that is hosted by NGINX and has a MariaDB database. 

### Reqiurements:
- WordPress, NGINX and MariaDB all have their own containers and communicate with each other using a single Docker network. 
- Two volumes have to be created, one for the MariaDB database and one for the WordPress website files. 
- Write our own Dockerfiles, one for each service.
- All images, networks, and volumes should be set up by a single docker-compose.yml file.
- The project has to be done on a Virtual Machine.

![A diagram that demonstrates the expected structure of the finished project.  Based on the diagram given in the subject.](/Users/maiadegraaf/CLionProjects/inception/imgs/inception_diagram.001.png "Diagram of Structure")

## Implementation



### Final Thoughts

## Examples

## Installation
### Clone the repository:
``` 
git clone https://github.com/maiadegraaf/minirt.git
cd minirt
make
```

### Run
