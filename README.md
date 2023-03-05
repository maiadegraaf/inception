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
      * [Docker vs Virtual Machines](#docker-vs-virtual-machines)
    * [NGINX](#nginx)
    * [MariaDB](#mariadb)
    * [WordPress](#wordpress)
  * [Implementation](#implementation)
    * [Network](#network)
    * [Volumes](#volumes)
    * [MariaDB](#mariadb-1)
    * [WordPress](#wordpress-1)
    * [NGINX](#nginx-1)
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
Docker Compose allows you to define and run multiple Docker containers through a single command.  Instead of starting up each container and service individually you can set up a YAML file that allows you to configure and start your application with the single command `docker compose`. This YAML file is called `docker-compose.yml`.
<br><br>[[source](https://docs.docker.com/compose/)]

#### Setting up images with or without Docker Compose
When you use Docker Compose to set up images, usually by calling Dockerfiles, it allows you to set up multiple images using one command, as well as other common objects that are shared such as volumes and networks. However, without Docker Compose you have to set up each image individually and manually add volumes and networks to each image.  Not only is this quite tedious it is also prone to user error, especially if you have to change something in the configuration as you then have to manually take down each image.  Whereas with Docker Compose it is just a single command. 

#### Docker vs Virtual Machines

|             | DOCKER                                                                                 | VM                                                                                |
|:------------|----------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| OS          | Shares an operating system with their host, which means they consume less resources.   | Designed to emulate virtual hardware and therefore has it's own operating system. |
| Performance | Uses less resources and therefore has a higher performance.                            | Uses more resources and therefore has a lower performance.                        |
| Portability | Easily ported as they don't have their own OS, makes it accessible by multiple people. | Can only operate on the host device and therefore not portable.                   |
| Security    | Each container is isolated from the host and other containers.                         | Each VM is isolated from the host and other VMs.                                  |
| Scalability | Easy to scale as containers can be easily added or removed.                            | More difficult to scale as a new VM has to be created.                            |
| Maintenance | Each container can be updated individually.                                            | Updating a VM requires the entire VM to be updated.                               |
| Cost        | Free                                                                                   | Can be expensive to maintain.                                                     |

#### Network
A docker-network is a virtual network that allows containers to communicate with each other.  Docker networks are isolated from the host network and other networks.  Docker networks are useful for services that need to communicate with each other.  In this project it allows the WordPress website, MariaDB database, and NGINX webserver to communicate with each other to store and retrieve data.

#### Volumes
A Docker volume is a directory on the host that is mapped to a directory on the container.  This allows data to persist between container restarts.  This is useful for services that need to store data.  Both the WordPress website and MariaDB database in this project need to store data such as images, videos, user information, and other files.  If the container is restarted the data would be lost unless it is stored in a volume.

### NGINX
NGINX is a web server that can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache.  It is a popular choice for web servers as it is lightweight and high performing.  It is also very flexible and can be configured to serve a wide variety of static content.
<br><br> [[source](https://www.nginx.com/resources/glossary/nginx/)]

### MariaDB
 MariaDB is a _"community-developed, commercially supported fork of the MySQL relational database management system (RDBMS)"_ which is a program that allows users to interact with a database. It is used for various purposes, including data warehousing, e-commerce, logging applications, and many more.  It is also used by many popular web applications such as WordPress, Joomla, and Drupal.
<br><br> [[source](https://en.wikipedia.org/wiki/MariaDB)]

### WordPress
_"WordPress is a free and open-source content management system written in PHP and paired with a MySQL or MariaDB database. Features include a plugin architecture and a template system."_
<br> [[source](https://en.wikipedia.org/wiki/WordPress)]

Essentially, WordPress allows users to create and manage their own websites without having to know how to code.  It is a popular choice for many websites as it is easy to use and has a large community of developers that are constantly improving it.  It is also very flexible and can be used for a wide variety of purposes, including blogs, e-commerce, and even forums.

## Implementation
This project was quite finicky, and it was often quite difficult to understand the root of errors.  For this reason I tried to build the project up slowly, first by setting up the network, then configuring the volumes, and finally one container at a time and only moving to the next part once all errors were resolved.  I also waited to move the project to a virtual machine as they are notoriously slow.

### Docker Compose
The first step was to set up the [`docker-compose.yml`](./src/docker-compose.yml) file.  This file is used to configure the containers and services that will be used in the project.  It is also used to configure the volumes and networks that will be used.  The file is structured as follows:
```yml
version: "3"
services:
  <service_name>:
    image: <image_name>
    container_name: <container_name>
    build: <build_path>
    restart: always
    networks:
      - <network_name>
    volumes:
      - <volume_name>:<volume_path>
```

#### Network
I first created a new network in the `docker-compose.yml` file which I aptly named `lenetwork`:
```yml 
networks:
  lenetwork:
```
I then added the network to each of the  containers that needed to communicate with each other.  In this case that was the MariaDB container, the WordPress container, and the NGINX container:
```yml
services:
  mariadb:
    image: mariadb
    restart: always
    networks:
      - lenetwork
  nginx:
    image: nginx
    restart: always
    networks:
      - lenetwork
  wordpress:
    image: wordpress
    restart: always
    networks:
      - lenetwork
```

#### Volumes
I then created two new volumes in the `docker-compose.yml` file which I named `db` and `wp`:
```yml
volumes:
  db:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: /home/mgraaf/data/mariadb
  wp:
    driver: local
    driver_opts:
      type: none
      o: bind
      device: /home/mgraaf/data/wordpress
```
Where the driver is set to `local` as I am using a local volume,
and the driver options which can be used to provide extra options for the driver.  The options are set to `type: none` to indicate that no special volume type is needed, `o: bind` to indicate that the volume should be bind-mounted, and `device: <path>` where the path is the path to the directory on the host that will be used to store the data.

The `db` volume is used to store the MariaDB database, and the `wp` volume is used to store the WordPress website.  I then added the volumes to the MariaDB, WordPress, and NGINX containers:
```yml
services:
  mariadb:
    #...
    volumes:
      - db:/var/lib/mysql
  nginx:
    #...
    volumes:
      - wp:/var/www/html
  wordpress:
    #...
    volumes:
      - wp:/var/www/html
```

#### Containers


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
