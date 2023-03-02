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


The subject provided a similar diagram to the one below to demonstrate the required structure of the project:
<div style="text-align: center;">
<img src="./imgs/inception_diagram.png" width="900px"/>
</div>

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
