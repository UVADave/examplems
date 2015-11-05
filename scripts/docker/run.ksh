docker-machine ip default
docker stop examplems
docker rm examplems
docker rmi uvadave/examplems:current  
docker run -d -p 8080:8080 -p 8081:8081 --name examplems uvadave/examplems:latest
