# first layer, parent image
# run image with alpine distro and node-v17 on it
FROM node:17-alpine

# when we run commands in a docker container, run it in the /app folder
# COPY . . after WORKDIR /app will copy files into /app folder 
WORKDIR /app

# copy files to the image
# first dot is current directory, where to copy files from, (relative filepath)
# second dot is where to copy files to, inside the docker image docker container has its own file system
# single dot means copy it to the root directory of the image

COPY . .

# run command on the image
# commad for installing dependencies
# this runs when the image is being created, not when we run the container
RUN npm install

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