FROM apache/superset:latest-dev
COPY docker /app/docker
COPY ./assets/images/superset-logo-horiz.png /app/superset/static/assets/images/superset-logo-horiz.png
