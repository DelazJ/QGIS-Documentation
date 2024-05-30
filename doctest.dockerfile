FROM qgis/qgis:latest

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install requirement first to use caching
COPY REQUIREMENTS.txt /documentation/REQUIREMENTS.txt
WORKDIR /documentation
RUN pip3 install -r REQUIREMENTS.txt

CMD make doctest
