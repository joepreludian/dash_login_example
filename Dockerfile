FROM docker.io/python:3.12-alpine3.19

RUN addgroup --gid '501' 'app' && adduser -G 'app' --disabled-password --uid '20' 'app'

RUN mkdir /app

RUN apk add curl

WORKDIR /app/

COPY ./README.md ./pyproject.toml ./pdm.lock /app/
COPY ./src/dashoffice /app/

RUN pip install .

RUN chown 501:20 -R /app/

USER app

WORKDIR /app/

CMD python app.py

HEALTHCHECK --interval=4s --retries=10 CMD curl --fail http://localhost:8050/ || exit 1

EXPOSE 8050
