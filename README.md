# App 

Here are some instructions to run the app locally, and a Heroku link to the app.

## Heroku

    https://pacific-inlet-36255.herokuapp.com/

## Some default accounts

### To login as admin

user: `admin@admin.com`
password: `admin1`

### To login as restaurante

user: `pizza_hot@restaurante.com`
password: `pizza_hot123`

### To login as client

user: `matias@gmail.com`
password: `usuario1`


## General things

* Ruby version: 2.6.0

* System dependencies: docker, docker-compose

## Configuration:

To build the app

    docker-compose build

In some linux distributions you have to run

    sudo chown -R $USER:$USER .

so you can have permission to edit the files.

To create the data base

    docker-compose run web rails db:drop
    docker-compose run web rails db:create
    docker-compose run web rails db:migrate
    docker-compose run web rails db:seed

## Run the app:

To start the server

    docker-compose up

Then open your web browser and enter to this URL

    http://localhost:3000/


If you want to stop the server

    docker-compose down

## Linux errors

If you got errors with all docker-compose command, you probably should run commands with `sudo` at the beginning, like

    sudo docker-compose command

Sometimes your distro don't initialize docker so you have to run

    sudo systemctl start docker

## Rubocop

To use rubocop

    docker-compose run web rubocop -x
