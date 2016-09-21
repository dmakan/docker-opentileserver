FROM ubuntu:14.04
RUN apt-get -y update

# default value for PBF_URL
ARG PBF_URL=http://download.geofabrik.de/europe/andorra-latest.osm.pbf 
RUN echo 'PBF_URL = ' $PBF_URL

# Install git
RUN sudo apt-get -y install git

# Tell git who you are
RUN git config --global user.name "docker nominatim"
RUN git config --global user.email "docker@nominatim.com"

# Clone the installer
RUN git clone https://github.com/MapFig/opentileserver.git

COPY opentileserver.sh /opentileserver/
WORKDIR /opentileserver/

RUN pwd
RUN ls -l

RUN echo 'deb http://us.archive.ubuntu.com/ubuntu trusty main multiverse' >> /etc/apt/sources.list
RUN cat /etc/apt/sources.list

RUN chmod 777 opentileserver.sh
RUN ./opentileserver.sh web bright $PBF_URL 

COPY OSMBright.xml /usr/local/share/maps/style/OSMBright/

ENTRYPOINT service postgresql restart && service apache2 start && service renderd restart && bash
