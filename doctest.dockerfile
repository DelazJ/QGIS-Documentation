FROM qgis/qgis:latest

# Install requirement first to use caching
COPY REQUIREMENTS.txt /documentation/REQUIREMENTS.txt
WORKDIR /documentation
RUN pip3 install -r REQUIREMENTS.txt

CMD make doctest
