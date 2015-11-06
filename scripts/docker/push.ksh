# set the definitions
INSTANCE=examplems
NAMESPACE=uvadave

# push the current image
docker push $NAMESPACE/$INSTANCE

# all good
exit 0
