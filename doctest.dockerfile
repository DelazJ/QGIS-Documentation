FROM qgis/qgis:latest

RUN apt-get install -y python3-venv && \
    python3 -m venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"
# Install requirement first to use caching
COPY REQUIREMENTS.txt /documentation/REQUIREMENTS.txt
RUN pip3 install -r /documentation/REQUIREMENTS.txt

WORKDIR /documentation

CMD ["make", "doctest"]
