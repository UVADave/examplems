# set the definitions
INSTANCE=examplems
NAMESPACE=uvadave

# get the IP address of the docker engine
docker-machine ip default

# stop the running instance
docker stop $INSTANCE

# remove the instance
docker rm $INSTANCE

# remove the previously tagged version
docker rmi $NAMESPACE/$INSTANCE:current  

# tag the latest as the current
docker tag $NAMESPACE/$INSTANCE:latest $NAMESPACE/$INSTANCE

# run the instance
docker run -d -p 8080:8080 -p 8081:8081 --name $INSTANCE $NAMESPACE/$INSTANCE:latest

# all good
exit 0
