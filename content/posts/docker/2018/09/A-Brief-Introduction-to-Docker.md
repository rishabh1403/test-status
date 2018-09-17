---
title: "A Brief Introduction to Docker"
description: "In this post we will introduce dockers a bit, just a bit of preparation for what is to come in near future on my blog."
author: "Rishabh Jain"
keywords: ["rishabh","jain","rishabh jain","rishabh1403","blog","programming","tech","technology","docker","introduction"]
tags: ["docker"]
categories: ["docker"]
date: 2018-09-17T23:01:36+05:30
draft: false
---
In this post we will introduce dockers a bit, just a bit of preparation for what is to come in near future on my blog.
<!--more-->

![Docker](https://c1.staticflickr.com/1/778/22947137613_69a88cb94b_b.jpg)

## The Origins
    
The foundation for Docker was laid by Solomon Hykes, as an in-house project at dotCloud. [Docker](www.docker.com) was made open source in March 2013, but the hype really began around June when Docker Inc. announced the release of Docker 1.0 and the rest is history. 

According to Docker, the number of applications containerized in the past years is somewhere in the vicinity of a whopping 3.5 million. Not only that, over 37 billion "dockerized" applications have been downloaded, thus far, and the number is growing by the minute.

## What's the hype about?

Containerization is not a recent technology. It's been around for quite some time (e.g. LXC, in its rudimentary form) and yet it wasn't doing rounds over the Internet... until the inception of Docker.

Basically, Docker makes life a whole lot simpler. It's appeal mainly lies in its ability to provision the delivery of lightweight, portable and isolated bundle of applications without the need of running multiple OS instances on a Hypervisor. It saves a ton of resources, thus ["reducing the infrastructure and maintenance costs of supporting an existing application portfolio"](https://www.docker.com/why-docker). Not to mention, the degree of ease which docker brings to the table helps a great deal in expediting the process of continuous integration, delivery, and deployment.

## How does it work?

Docker is primarily developed for Linux and relies on its key component **libcontainer**, which enables direct leveraging of the virtualization facilities provisioned by the Linux kernel. Formerly, Docker relied on LXC as its default execution environment but it was dropped since the release of version **0.9**.

![Layers of a container based on the Ubuntu image](https://docs.docker.com/v17.09/engine/userguide/storagedriver/images/sharing-layers.jpg "Courtesy - https://docs.docker.com")

#### Container

> A docker **container** runs natively on Linux and shares the kernel of the host machine with other containers. It runs a discrete process, taking no more memory than any other executable, making it lightweight.

So basically, Docker abstracts out the kernel and runs a very lightweight containerized instance of an application on top of it. These containers, by themselves, add very little overhead and are optimized to make use of already existing information by usage of a [union mount](https://en.wikipedia.org/wiki/Union_mount) filesystem, e.g. [aufs](https://en.wikipedia.org/wiki/Aufs) and [overlay](https://en.wikipedia.org/wiki/OverlayFS "OverlayFS"). 

#### Image

> A container is launched by running an **image**. An image is an executable package that includes everything needed to run an application--the code, a runtime, libraries, environment variables, and configuration files.

In other words, a container is just the running instance of an image. Images can be built using a [Dockerfile](https://docs.docker.com/engine/reference/builder/#usage). 

A Dockerfile contains all the instructions required to put together an image. Once created, multiple container instances can be spawned using a single base image, which will be shared across all the containers. It is important to note that an image is **read-only** with a **mutable layer**, to which a container can write. An image once built cannot be manipulated during the course of its execution. You can find an in-depth explanation of how images and containers work in the [official documentation](https://docs.docker.com/v17.09/engine/userguide/storagedriver/imagesandcontainers/).

## Until Next Time

This has been a short introduction to Docker. In conclusion, Docker *is* what can be termed as a "disruptive technology" and it is here to stay. We will get down and dirty with actually creating and deploying Docker very soon. Until then, have a nice day.There you go guys, you made it to end of the post. Subscribe to my [youtube channel](https://www.youtube.com/channel/UC4syrEYE9_fzeVBajZIyHlA) and my mailing list below for regular updates. Follow me on [twitter](https://www.twitter.com/rishabhjain1403) , drop me a mail or leave a comment here if you still have any doubts and I will try my best to help you out. Thanks

Stay tuned and see you around :)
