#!/usr/bin/env bash

DOMAIN=symfony.dev

function command_help() {
    echo "Usage: $0 [option...] {start|stop|status}" >&2
    echo ""
    echo "options:"
    echo " -h, --help           show this help."
    echo " -p, --provision      force provisioning of the containers."
    echo
    exit 1
}

function installCerts() {
    subj="/C=IT/ST=Milan/L=Milan/O=spotistats/CN=*.$DOMAIN"
    openssl req -new -batch -subj "${subj}" -newkey rsa:2048 -nodes -keyout $DOMAIN.key -out $DOMAIN.csr
    openssl x509 -req -days 365 -in $DOMAIN.csr -signkey $DOMAIN.key -out $DOMAIN.crt
    mv $DOMAIN.key ./config/docker/nginx-proxy/certs/$DOMAIN.key
    mv $DOMAIN.crt ./config/docker/nginx-proxy/certs/$DOMAIN.crt
    mv $DOMAIN.csr ./config/docker/nginx-proxy/certs/$DOMAIN.csr
}

# function that implement provisioning logic.
function provisioning() {
    echo "START PROVISIONING..."

    echo "1. Copying the docker-compose distribution file..."
    cp docker-compose.override.yml.dist docker-compose.override.yml

    echo "2. Copying the empty .bash_history distribution file..."
    cp config/docker/web/.bash_history.dist config/docker/web/.bash_history

    echo "3. Copying the .env distribution file, if not exists..."
    if [[ ! -f ".env" ]]; then
        cp .env.dist .env
    fi

    echo "4. Installing certs..."
    installCerts

    echo "5. Starting docker containers..."
    docker-compose up -d

    echo "6. Installing vendors through composer..."
    docker-compose exec web bash -c 'composer install'

    touch provisioned.lock
}

provision=false
while :; do
    case $1 in
        -h|--help)
            command_help
            exit
            ;;
        -p|--provision)
            provision=true
            ;;
        start)
            if [[ ( ${provision} = true ) || (! -f "provisioned.lock") ]]; then
                echo "starting setup"
                provisioning
            else
                docker-compose up -d
            fi
            ;;
        stop)
            echo "stop"
            docker-compose stop
            ;;
        status)
            docker-compose ps
            ;;
        help)
            command_help
            exit
            ;;
        *)  # Default case
            command_help
            exit
    esac
    shift
done