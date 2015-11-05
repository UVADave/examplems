sudo docker-machine ip default
sudo docker stop examplems
sudo docker rm examplems
sudo docker rmi docker.example.com/examplems:current  
sudo docker run -d -p 8080:8080 -p 8081:8081 --name examplems uvadave/examplems:latest
