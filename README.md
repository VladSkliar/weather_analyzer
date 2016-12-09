# Weather Analyzer #

## Running on localhost ##

1) Clone project to your local machine
```
#!bash

git clone https://VladSkliar@bitbucket.org/VladSkliar/weather_analyzer.git
```

2) Go to cloned folder

```
#!bash

cd weather_analyzer/
```

3) Create virtual environment for project
```
#!bash

virtualenv venv
```

4) Switch to virtual environment

```
#!bash

source venv/bin/activate
```

5) Install all dependencies listed in requirements.txt to virtual environment

```
#!bash

pip install -r requirements.txt
```
6) Install PostgreSQL (depends on your operation system) and execute next commands: 

```
#!sql

psql
create user competeraprog with password '123456';
create database test_competera with owner competeraprog;
```

7) Generate tables and fill initial data

```
#!bash

./manage.py makemigrations
./manage.py migrate
```

8) Install Redis and start redis
9) Start celery worker and beat
```
#!bash

celery -A wether_analyzer beat -l info
celery -A wether_analyzer worker -l info
```
10) Run test to check models and api
```
#!bash

./manage.py test
```
11) Run server
```
#!bash

./manage.py runserver
```

You can use dump.sql for example.
API have filters.
```
#!bash

/api/weather/?city__title={City name}
/api/weather/?to_date=2016-02-11 # Get you weather that have date less or equal to_date
/api/weather/?from_date=2016-02-11 # Get you weather that have date higher or equal from_date
```
You can use all filter together
```
#!bash

/api/weather/?city__title={City name}&to_date=2016-02-11&from_date=2016-02-07
```