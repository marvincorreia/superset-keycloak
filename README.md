# Superset + Keycloak

Superset with keycloak integration using OpenID Connect

- Single sign on (SSO)
- Using keycloak to login into superset application

# Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [docker-compose](https://docs.docker.com/compose/install/)

# Installation

### Clone the repository on your computer:

Clone repo and generate local configuration files:
```
git clone https://github.com/marvincorreia/superset-keycloak.git
cd superset-keycloak
cp .env.example .env
cp ./docker/pythonpath_dev/client_secret.example.json ./docker/pythonpath_dev/client_secret.json
```

1. For first you need to setup a database;
2. Setup the keycloak server if you dont have one;
3. Load the [superset-client.json](docs/files/superset-client.json) into your keycloak realm clients and ensure to regenate superset client secret credential;
5. After that changes the variables from **.env** and **client_secret.json** to your own environment setup.

# Running Project

The project contains dockerized apps for development and production environments

## Development

If you need to personalize your superset application like logos and styles you need run the project in development mode, to ensure te changes reflects without rerun the project.

**RUNNING IN DEVELOPMENT**
```
docker-compose up
```

The compose file will build the images and run the superset in development mode, be pacient maybe it might take a while at first time build.

Visit http://localhost:8088 by default to access the superset app

## Production

**RUNNING IN PRODUCTION**

Ensure the development containers is not running
```
docker-compose down
```
and than run the production compose file
```
docker-compose -f docker-compose.prod.yml up -d
```
Visit http://localhost:8088 by default to access the superset app



