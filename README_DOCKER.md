## Docker
We have added docker and docker-compose files to this project.
Below are instruction on how to use them.

### Make sure you have docker and docker-compose installed:

##### Linux
1. [Install Docker](https://docs.docker.com/engine/installation/)
2. [Install Docker Compose](https://docs.docker.com/compose/install/)

##### OSX / Windows
- If you are on Mac, check out [Docker for Mac](https://docs.docker.com/docker-for-mac/)
- If you are on Windows, check out [Docker for Windows](https://docs.docker.com/docker-for-windows/)

These will install `docker`, `docker-compose`, and `docker-machine` on your machine.


###  Get ualbertalib/DMP_roadmap source code
Clone the repository from github:
``
git clone https://github.com/ualbertalib/DMP_roadmap.git
cd DMP_roadmap
``

Change to config directory and create branding.yml, database.yml and secrets.yml
examples are in the same directory. Make sure you update development password in database.yml to
make one in .env file (default set to 'changeme' in .env file)
``
development:
  adapter: mysql2
  database: roadmap
  username: root
  password: changeme
  encoding: utf8mb4
``


### Build docker DMP_roadmap docker image
``
docker build . -t ualbertalib/dmp_roadmap
``

### Start docker compose
``
docker-compose up -d
``

### Run database setup (this needs to be done only once)
``
docker-compose run web rake db:setup
``
It will take a while to run db:setup, it will create DMP_roadmap database, create tables and load
data. You will need to run
``
docker-compose up -d
``
again to restart web docker container.
This procedure will have to be done once only, when you create db volume.
If you delete db volume
``
docker-compose down --volumes
``
you will have to follow this step again.

### Go to DMP_roadmap web site
Point your browser and go to the following url:

[localhost:3000](http://localhost:3000)


### How to run the test suite

#### Start up all the docker containers using docker compose

  ``
  docker-compose up -d
  ``

#### Run test database setup (only need to be done once):
  ``
  docker-compose run -e "RAILS_ENV=test" web rake db:setup
  ``

#### Run the test suite via rspec:
  ``
  docker-compose run -e "RAILS_ENV=test" web rspec
  ``

### Usefull commands

  To check all container logs:

  ``
  docker-compose logs
  ``

  To check all container logs for a specific container:

  ``
  docker-compose logs web
  ``
