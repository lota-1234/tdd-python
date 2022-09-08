FROM python:3.8-alpine

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 --version

RUN pip3 install flask

RUN pip3 install -r requirements.txt

COPY . /app

ENTRYPOINT FLASK_APP=flaskr flask run --host=0.0.0.0