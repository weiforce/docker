FROM python:2-alpine

RUN apk add --no-cache git
RUN git clone https://github.com/limkokhole/blogspot-downloader.git
RUN cd blogspot-downloader && pip2 install -r requirements_py2.txt #python 2
RUN pip install python-dateutil
