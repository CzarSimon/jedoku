NAME='jedoku'
IMAGE='czarsimon/jedoku:jenkins.2.149-kubectl.1.12.1'

docker run -d --name $NAME \
    -p 4040:8080 -p 50000:50000 --restart always \
    --mount "source=$NAME,target=/var/jenkins_home" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    $IMAGE
    
