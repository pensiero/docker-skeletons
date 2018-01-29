Symfony 4.0 skeleton
====================

This skeleton is based on the official [Symfony 4.0 skeleton](https://github.com/symfony/skeleton/blob/4.0/composer.json).

Features:
- web container with PHP-FPM 7.2
- nginx reverse proxy
- mysql database
- phpMyAdmin

Get started with Symfony, read the [official docs](https://symfony.com/doc/current/setup.html).

# Setup

First time run:

```bash
./setup.sh start
```

After first setup you can use `docker-composer` to manage your containers.

# Live in your browser

Be sure that the every the `www.symfony.dev` and `phpmyadmin.symfony.dev` point to `127.0.0.1`.

You could point every `.dev` domain to `127.0.0.1` (more about it in the main README of the project), or add in your `hosts` file the following lines:

```
127.0.0.1 www.symfony.dev phpmyadmin.symfony.dev
```

Finally, go to www.symfony.dev.

## PhpMyAdmin

For convenience, we ship this skeleton with a Mysql web GUI, PhpMyAdmin.

Go to phpmyadmin.symfony.dev, user `root`, password `secret`.

# What's happening

Every container configs is stored in the `config/` folder.

# Info

### Database credentials

- Host: `mysql` (name of the container in the `docker-compose.yml` file)
- User: `root`
- Password: `secret`

### Helpful docker-compose commands

Status
```bash
docker-compose ps
```

Start all the containers
```bash
docker-compose up -d
```

Stop your containers
```bash
docker-compose down
```

Enter inside the `web` container (where the main application is located)
```bash
docker-compose exec web bash
```