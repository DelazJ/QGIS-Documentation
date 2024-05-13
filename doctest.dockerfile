FROM qgis/qgis:latest

RUN python3 -m venv /opt/venv
# Install requirement first to use caching
COPY REQUIREMENTS.txt /documentation/REQUIREMENTS.txt
RUN . /opt/venv/bin/activate &&  pip3 install -r /documentation/REQUIREMENTS.txt

WORKDIR /documentation

CMD . /opt/venv/bin/activate && make doctest
