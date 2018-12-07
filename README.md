# docker-hub-git-lessons
Simple Dockerfile build with git repository
Build the image or pull with:
docker pull jacknorthrup/var2:latest

Very simple mostly for Demo Use.
start the docker with ./Menu
--- Menu ---

#!/bin/bash
#  Bash Menu Script Example


PS3='Please enter your choice: '
options=("Start jacknorthrup/var:latest Docker" "Stop jacknorthrup/var:latest Container" "Restart jacknorthrup/var:latest Container" \
    "Remove gs-container Container" "Copy Container Dir gs-container Here" "Enter the Docker Container gs-container" \
    "Firefox http://localhost:8888" "Docker ps" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Start jacknorthrup/var:latest Docker")
            echo "Open http://localhost:8888 with your browser. "
            sudo xhost +
            docker run -it -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd)/notes:/notes --privileged --name gs-container jacknorthrup/var:latest
            ;;
        "Stop jacknorthrup/var:latest Container")
            docker stop gs-container
            ;;
        "Restart jacknorthrup/var:latest Container")
            docker start gs-container
            ;;
        "Remove gs-container Container")
            docker rm gs-container
            ;;
        "Copy Container Dir gs-container Here")
            sudo docker cp gs-container:/notes/. .
            ;;
        "Enter the Docker Container gs-container")
            docker exec -it gs-container bash
            ;;
        "Firefox http://localhost:8888")
            firefox http://localhost:8888
            ;;
        "Docker ps")
            docker ps
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done

