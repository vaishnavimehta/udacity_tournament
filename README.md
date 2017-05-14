# Tournament Results

Udacity Full Stack Developer Nanodegree

### Project Specifications

You will develop a database schema to store the game matches between players.
You will then write code to query this data and determine the winners of
various games

### Steps to run

1. Using [vagrant](https://www.vagrantup.com/downloads.html):

A Vagrantfile has been provided that will setup postgresql and create
the required schema for the **tournament**

* Install [vagrant](https://www.vagrantup.com/downloads.html) for your platform ```https://www.vagrantup.com/downloads.html```
* Startup vagrant: ```vagrant up```
* Login to the vagrant VM: ```vagrant ssh```
* Move the shared folder: ```cd /vagrant```
* Run the tests: ```python tournament_test.py```

2. Running on your machine

* You will need to install postgresql
* Install python and pip
* Install the python dependencies, ```pip install -r requirements.txt```
* Create the schema: ```psql - f tournament.sql```
* Run the tests: ```python tournament_test.py```