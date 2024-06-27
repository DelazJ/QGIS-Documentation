FROM qgis/qgis:latest

# Install requirement first to use caching
COPY REQUIREMENTS.txt /documentation/REQUIREMENTS.txt
RUN python3 -m venv docsenv
RUN . docsenv/bin/activate
RUN pip3 install -r /documentation/REQUIREMENTS.txt

WORKDIR /documentation

CMD make doctest-gh
