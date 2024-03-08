# Commandes efféctuées

Voici les commandes efféctuées pour le projet "fil rouge"

## Set up

```bash
$ # Clone sources
$ git clone https://github.com/AymeRx/flask-pandas-dataframe.git
$ cd flask-pandas-dataframe
$
$ # Virtualenv modules installation (Unix based systems)
$ source ../docker-aston-poec/venv/bin/activate
$
$ # Install dependencies
$ pip3 install -r requirements.txt
$
$ # Create database via Flask CLI
$ flask shell
>>> from app import db  # import SqlAlchemy interface 
>>> db.create_all()     # create SQLite database and Data table 
>>> quit()              # leave the Flask CLI  
$
$ # Load the data into the database
$ flask load-data titanic-min.csv
$
$ # Set the FLASK_APP environment variable
$ export FLASK_APP=app.py
$ 
$ flask run --host=0.0.0.0 --port=31201
$ # access the app in the browser: http://34.163.111.64:31201/
```

<br />

## Dockerfile
```bash
#Création du Dockerfile
nano Dockerfile

#Dockerfile
FROM python:3.8-slim-buster

# Ajout des sources
ADD . /app/sample-flask-pandas-dataframe

WORKDIR /app/sample-flask-pandas-dataframe


# Virtualenv
RUN pip install virtualenv
RUN virtualenv env
RUN /bin/bash -c "source env/bin/activate"
RUN pip install -r requirements.txt

ENV FLASK_APP=app.py

# Ajout des droits d'exécution et lancement du script_flask pour la base de données
RUN chmod +x script.sh
CMD [ "./script.sh" ]

# Démarrage du serveur de dev sur le port 5000
EXPOSE 5000

CMD ["flask", "run", "--port=5000"]


# build le contener
docker build -t flask-panda .


## Envoie du de l'image sur le Docker Hub

#login a Docker Hub
docker login -u aymerx

docker image tag flask-panda:latest aymerx/flask-panda:latest
 
docker push aymerx/flask-panda:latest

#run l'image
docker run -d -p 31201:5000 flask-panda
```

## Suite
Je suis bloquer ici et je ne peux pas continuer car mon docker ne fonctionne pas :(
