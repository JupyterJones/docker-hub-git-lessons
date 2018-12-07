# docker-hub-git-lessons<br />
Simple Dockerfile build with git repository<br />
Build the image or pull with:<br />
docker pull jacknorthrup/var2:latest<br />

Very simple mostly for Demo Use.<br />
start the docker with ./Menu<br />
--- Menu ---<br />

#!/bin/bash<br />
#  Bash Menu Script Example<br />


PS3='Please enter your choice: 'options=("Start jacknorthrup/var:latest Docker" "Stop jacknorthrup/var:latest Container" "Restart jacknorthrup/var:latest Container" \<br />
    "Remove gs-container Container" "Copy Container Dir gs-container Here" "Enter the Docker Container gs-container" \<br />
    "Firefox http://localhost:8888" "Docker ps" "Quit")<br />
select opt in "${options[@]}"<br />
do<br />
    case $opt in<br />
        "Start jacknorthrup/var:latest Docker")<br />
            echo "Open http://localhost:8888 with your browser. "<br />
            sudo xhost +<br />
            docker run -it -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd)/notes:/notes --privileged --name gs-container jacknorthrup/var:latest<br />
            ;;<br />
        "Stop jacknorthrup/var:latest Container")<br />
            docker stop gs-container<br />
            ;;<br />
        "Restart jacknorthrup/var:latest Container")<br />
            docker start gs-container<br />
            ;;<br />
        "Remove gs-container Container")<br />
            docker rm gs-container<br />
            ;;<br />
        "Copy Container Dir gs-container Here")<br />
            sudo docker cp gs-container:/notes/. .<br />
            ;;<br />
        "Enter the Docker Container gs-container")<br />
            docker exec -it gs-container bash<br />
            ;;<br />
        "Firefox http://localhost:8888")<br />
            firefox http://localhost:8888<br />
            ;;<br />
        "Docker ps")<br />
            docker ps<br />
            ;;<br />
        "Quit")<br />
            break<br />
            ;;<br />
        *) echo invalid option;;<br />
    esac<br />
done<br />

