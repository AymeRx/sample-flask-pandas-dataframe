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

CMD ["flask", "run", "--port=5000", "--host=0.0.0.0"]