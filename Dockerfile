# first layer, parent image
# run image with alpine distro and node-v17 on it
FROM node:17-alpine

# when we run commands in a docker container, run it in the /app folder
# COPY . . after WORKDIR /app will copy files into /app folder 
WORKDIR /app

# by moving RUN npm install before copying files we can leverage cashing for faster build
# however we cannot npm install before package.json is copied to the image
# but we can copy package.json alone first, install dependencies and THEN copy the files
# this way, if we make changes to the source code, the first 4 layers can be copied from the cache
COPY package.json .

# run command on the image
# commad for installing dependencies
# this runs when the image is being created, not when we run the container
RUN npm install

# copy files to the image
# first dot is current directory, where to copy files from, (relative filepath)
# second dot is where to copy files to, inside the docker image docker container has its own file system
# single dot means copy it to the root directory of the image

COPY . .



# expose port
EXPOSE 3000

# this allows us to input commands at runtime when container begins to run 
CMD ["node", "app.js"]

# build image from the docker file, dot means build image from the docker file in the . directory (relative)
# docker build -t my_image .

# build container from the image
# docker run --name c1_server -p 3001:3000 -d my_second_docker_image

# start container
# docker start c1_server

# stop container 
# docker stop c1_server

# docker cashes image after creating each layer
# when new docker image is being created, docker looks into cash to find some images it can use 
# to speed up the build


# Logs
#  => [internal] load build definition from Dockerfile                                                                                                     0.1s 
#  => => transferring dockerfile: 32B                                                                                                                      0.0s 
#  => [internal] load .dockerignore                                                                                                                        0.1s 
#  => => transferring context: 34B                                                                                                                         0.0s 
#  => [internal] load metadata for docker.io/library/node:17-alpine                                                                                        0.9s 
#  => [1/5] FROM docker.io/library/node:17-alpine@sha256:76e638eb0d73ac5f0b76d70df3ce1ddad941ac63595d44092b625e2cd557ddbf                                  0.0s 
#  => [internal] load build context                                                                                                                        1.0s 
#  => => transferring context: 63.16kB                                                                                                                     0.9s 
#  => CACHED [2/5] WORKDIR /app                                                                                                                            0.0s 
#  => CACHED [3/5] COPY package.json .                                                                                                                     0.0s 
#  => CACHED [4/5] RUN npm install                                                                                                                         0.0s 
#  => [5/5] COPY . .                                                                                                                                       0.4s 
#  => exporting to image                                                                                                                                   0.5s 
#  => => exporting layers                                                                                                                                  0.4s 
#  => => writing image sha256:e13f5d8043a39f85b575ac0e031d9eaddd6d7d7372870b11bfc8f04dcf28f3bd                                                             0.0s
#  => => naming to docker.io/library/c8_server 