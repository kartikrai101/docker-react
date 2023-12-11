# BLOCK 1
FROM node:16-alpine as builder 

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . . 

RUN npm run build

# after 1st block is executed, all of our build content is going to be in 
# '/app/build' directory

# BLOCK 2
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

