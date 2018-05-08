#!/bin/bash

project_path=$(pwd)/../

echo $project_path

docker_image_name=xiaominfc/centos_tt_test
docker_file=./Dockerfile

docker kill $(docker ps -q)
docker build --rm -t $docker_image_name -f $docker_file . 

docker run -d  --privileged=true -v "$project_path:/opt/tt_source_code"   $docker_image_name
docker exec -it $(docker ps -q) /bin/bash

