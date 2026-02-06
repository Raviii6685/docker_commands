#some of the custom variabels we can say 
#ARG => these are the build time varibles dont exist on run time 
#ENV => these exist inside the container at runtime 
ARG GOLANG_VERSION=1.23.4

#in this alpine we have already installed Go -> by doing the below steps we will going to execute all this 
#go installed -> dependecies are also downloading -> source code copied 

#this is the base image that will be needed for our project
FROM golang:${GOLANG_VERSION}-alpine AS base

#all the commands will be executed in this folder of the container
WORKDIR /src
#from the build context these two files will be copied for essence ; this are also for the docker cache optimization
COPY go.sum go.mod .

# go mod download will downlaod above 2 files what we have just copied but ; as dur to cache optimization this will not downlaoded again
RUN go mod download 
# copy the whole current directory into the working directory
COPY . .



#in multistage build every stage is building a whole new container for the execution
#that is why client and server binaries are made in different stages







#till now we have completed the stage 1 of the multistage build 
FROM base AS build-client 
RUN go build -o /bin/client ./cmd/client 

FROM base as build-server 
RUN go build -o /bin/server ./cmd/server


#till now we have created the executable bin files ; now its time to remove the no production files 
#no os ,  shell , package manager , attack surface ; only just those thing which we will copy 
#this scratch is only used when binary file is static Go has static 
#this will help us a lot in making our container very small and removing the surface area for attack
FROM scratch AS prod 
COPY --from=build-client /bin/client /bin/
COPY --from=build-server /bin/server /bin/

#container start hote hii server chlega 
#CMD is used to give comand in future
ENTRYPOINT [ "/bin/server" ]

