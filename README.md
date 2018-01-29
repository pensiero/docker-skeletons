Docker Skeletons
==========

Init with a single line of code your favourite framework thanks to **Docker**.

Every skeleton has an independent Docker configuration, with multiple `Dockerfile` and `docker-compose.yml` files.


## Installation

> NOTE: installation instructions may differ from project to project. Check the *README* of each skeleton.


### .dev domains

It's suggested to point every `.dev` domains to `127.0.0.1` (in your `hosts` file).
Otherwise you could manually add the domains of your interest; for example, if you are running the Symfony skeleton, you need to add:
```
127.0.0.1 www.symfony.dev
```
in your `hosts` file.

If you are working with OSX, you could use *dnsmasq*, Thomas Sutton posted and [handful how-to](https://passingcuriosity.com/2013/dnsmasq-dev-osx/).

### Running the skeleton

If nothing particular is specified in the README of the skeleton, simply run:

```
docker-compose up -d
```