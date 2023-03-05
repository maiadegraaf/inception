# inception

*A System Administration related exercise.*

## Table of Contents
- [The Challenge](#the-challenge)
- [Implementation](#implementation)
    - [Final Thoughts](#final-thoughts)
- [Examples](#examples)
- [Installation](#installation)

<!-- TOC -->
* [inception](#inception)
  * [Table of Contents](#table-of-contents)
  * [The Challenge](#the-challenge)
    * [Reqiurements:](#reqiurements-)
  * [Concepts](#concepts)
    * [Docker](#docker)
      * [How Docker Works](#how-docker-works)
      * [How Docker Compose Works](#how-docker-compose-works)
      * [Setting up images with or without Docker Compose](#setting-up-images-with-or-without-docker-compose)
  * [Implementation](#implementation)
    * [Network](#network)
    * [Volumes](#volumes)
    * [MariaDB](#mariadb)
    * [WordPress](#wordpress)
    * [NGINX](#nginx)
    * [Final Thoughts](#final-thoughts)
  * [Examples](#examples)
  * [Installation](#installation)
    * [Clone the repository:](#clone-the-repository-)
    * [Run](#run)
<!-- TOC -->

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

## Concepts
The following are brief explanations and definitions of the concepts introduced in this project.
### Docker
[docs.docker.com](https://docs.docker.com/get-started/overview/) describes Docker as: _"an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly."_

#### How Docker Works
_"Docker packages, provisions and runs containers. Container technology is available through the operating system: A container packages the application service or function with all of the libraries, configuration files, dependencies and other necessary parts and parameters to operate. Each container shares the services of one underlying operating system. Docker images contain all the dependencies needed to execute code inside a container, so containers that move between Docker environments with the same OS work with no changes."_ 
<br><br> [[source](https://www.techtarget.com/searchitoperations/definition/Docker)]

#### How Docker Compose Works
Docker Compose allows you to define and run multiple Docker containers through a single command.  Instead of starting up each container and service individually you can set up a YAML file that allows you to configure and start your application with the single command `docker compose`. 
<br><br>[[source](https://docs.docker.com/compose/)]

#### Setting up images with or without Docker Compose
When you use Docker Compose to set up images, usually by calling Dockerfiles, it allows you to set up multiple images using one command, as well as other common objects that are shared such as volumes and networks. However, without Docker Compose you have to set up each image individually and manually add volumes and networks to each image.  Not only is this quite tedious it is also prone to user error, especially if you have to change something in the configuration as you then have to manually take down each image.  Whereas with Docker Compose it is just a single command.

#### Docker vs Virtual Machines

|            | DOCKER                                                                                                | VM                                                                                        |
|:-----------|-------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| OS         | Docker Containers share an operating system with their host, which means they consume less resources. | A VM is designed to emulate virtual hardware and therefore has it's own operating system. |
| Efficiency | Docker requires less resources which decreases start time and increases efficiency.                    | As                                                                                        |
|            |                                                                                                       |                                                                                           |
|            |                                                                                                       |                                                                                           |
|            |                                                                                                       |                                                                                           |
|            |                                                                                                       |                                                                                           |


## Implementation
This project was quite finicky, and it was often quite difficult to understand the root of errors.  For this reason I tried to build the project up slowly, first by setting up the network, then configuring the volumes, and finally one container at a time and only moving to the next part once all errors were resolved.  I also waited to move the project to a virtual machine as they are notoriously slow.

### Network


### Volumes

### MariaDB

### WordPress

### NGINX

### Final Thoughts

## Examples

## Installation
### Clone the repository:
``` 
git clone https://github.com/maiadegraaf/inception.git
cd inception
make
```

### Run
