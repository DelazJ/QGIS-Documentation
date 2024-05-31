FROM qgis/qgis:latest

#ENV VIRTUAL_ENV=/opt/venv
#RUN python3 -m venv $VIRTUAL_ENV
#ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN apt install python3-sphinx -y

# Install requirement first to use caching
COPY REQUIREMENTS.txt /documentation/REQUIREMENTS.txt
WORKDIR /documentation
#RUN pip3 install -r REQUIREMENTS.txt

#CMD  ["qgis", "--version"]
CMD make doctest



# see https://docs.docker.com/docker-cloud/builds/advanced/
# using ARG in FROM requires min v17.05.0-ce
#ARG QGIS_DOCKER_TAG=latest

#FROM  qgis/qgis:${QGIS_DOCKER_TAG}
#RUN apt-get install python3-sphinx

#RUN curl https://bootstrap.pypa.io/get-pip.py | python3

#WORKDIR /root

#RUN pip install --break-system-packages --upgrade sphinx

#RUN mkdir /root/pyqgis
#COPY . /root/pyqgis
#WORKDIR /root/pyqgis

#CMD /bin/bash -c "/root/pyqgis/scripts/build-docs.sh -v ${QGIS_VERSION} ${BUILD_OPTIONS}"
#CMD /bin/bash -c "make doctest"
