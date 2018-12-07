FROM gcc:latest
MAINTAINER jacknorthrup "madhatterstamps@gmail.com"

RUN apt-get update && apt-get install -y libgtk2.0-0 xauth x11-apps \
idle python-dev python-setuptools python-pip \
nano gedit locate htop mousepad 
RUN mkdir /notes
WORKDIR /notes
RUN pip install pillow
ENV PATH="/bin:/src/local/bin:${PATH}"
