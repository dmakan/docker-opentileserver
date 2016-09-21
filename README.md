# docker-opentileserver
=======================

### Build docker image for specific region:
docker build -t dmakan/ubuntu-opentileserver . --build-arg PBF_URL=http://download.geofabrik.de/europe/serbia-latest.osm.pbf

### Run docker container:
docker run -t -i -p 80:80 dmakan/ubuntu-opentileserver

### Example calls (from the host):
http://localhost/openlayers-example.html