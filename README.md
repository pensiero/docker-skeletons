Docker Skeletons
================

Init with a single line of code your favourite framework thanks to **Docker**.

Every skeleton has an independent Docker configuration, with multiple `Dockerfile` and `docker-compose.yml` files.

Read more about Docker and the amazin docker-compose in the [official docs](https://docs.docker.com/get-started/). 


# Setup

> NOTE: setup instructions may differ from project to project. Check the *README* of each skeleton.

If nothing particular is specified in the README of the skeleton, simply run:

```
docker-compose up -d
```

# Caveats

### `.dev` domains to localhost

It's suggested to point every `.dev` domains to `127.0.0.1` (in your `hosts` file).
Otherwise you could manually add the domains of your interest; for example, if you are running the Symfony skeleton, you need to add:
```
127.0.0.1 www.symfony.dev
```
in your `hosts` file.

If you are working with OSX, you could use *dnsmasq*, Thomas Sutton posted and [handful how-to](https://passingcuriosity.com/2013/dnsmasq-dev-osx/).


### Chrome, `.dev` domains and `https`

Unfortunatly Chrome doesn't like local development with `.dev` domains that use `https`. But I do.

So when you will face the "Unauthorized screen", simply type:
```
badidea
```

### Production-ready

Every skeleton ships with a `docker-compose.override.yml.dist` file. Why? Because your local environment could
(and usually is) different from the production environment.

During the setup phase, the `docker-compose.override.yml.dist` file is copied into a not versioned `docker-compose.override.yml` file (along with other files).