### Date 05-11-2024

* Once changes are done and need to publish the cometa/novnc image 

1. build the image using below command

    `docker build -t cometa/novnc:<YOUR-VERSION> -f Dockerfile-build .`

1. login to docker  
    `docker login -u user_name`

1. push to docker
    `docker push cometa/novnc:<YOUR-VERSION>`