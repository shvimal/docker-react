# Build phase
FROM node:alpine
WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# Run Phase - FROM statement actually depicts a new block or phase-
# /app/build will contain the result after build phase
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html