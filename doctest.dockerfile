FROM qgis/qgis:latest

# Install requirement first to use caching
COPY REQUIREMENTS.txt /documentation/REQUIREMENTS.txt
RUN python3 -m venv docsenv && . docsenv/bin/activate && pip3 install -r /documentation/REQUIREMENTS.txt

WORKDIR /documentation

CMD make doctest-gh
