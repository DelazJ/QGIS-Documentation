FROM qgis/qgis:latest

#RUN apt-get update && apt-get install -y python3 python3-pip
RUN python3 -m venv venv
# https://stackoverflow.com/questions/48561981/activate-python-virtualenv-in-dockerfile?noredirect=1&lq=1
#RUN virtualenv venv
# Install requirement first to use caching
COPY REQUIREMENTS.txt /documentation/REQUIREMENTS.txt
#RUN /bin/bash -c "source /venv/bin/activate && pip3 install -r /documentation/REQUIREMENTS.txt"

WORKDIR /documentation

#CMD make doctest
CMD ["/bin/bash", "-c", "source /venv/bin/activate;pip3 install -r /documentation/REQUIREMENTS.txt;make doctest;deactivate"]

# ENV VIRTUAL_ENV /venv
# RUN python3 -m venv $VIRTUAL_ENV
# ENV PATH "$VIRTUAL_ENV/bin:$PATH"