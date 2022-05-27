# superset frontend build
FROM node:16 AS superset-node
RUN npm install -g npm@7
RUN mkdir -p /app/superset-frontend
RUN mkdir -p /app/superset/static
WORKDIR /app/superset-frontend
COPY ./superset-frontend/package*.json ./
RUN npm ci
COPY ./superset-frontend ./
RUN npm run build
RUN rm -rf node_modules

# final stage
FROM apache/superset:latest-dev
USER root
WORKDIR /app
RUN python3 -m pip install itsdangerous==2.0.1 flask-oidc flask_openid
COPY --from=superset-node /app/superset/static/assets /app/superset/static/assets
COPY --from=superset-node /app/superset-frontend /app/superset-frontend
COPY docker /app/docker
