FROM python:3-slim
# tried using FROM python3.6-alpine but it did not work with oracle instant client  
# due to missing libresolv.so

RUN apt-get update \
    && apt-get install -y libaio1 unzip \
    && mkdir /app

ADD ./instantclient-basiclite-linux.x64-18.3.0.0.0dbru.zip \
    ./app.py \
	   /app/

WORKDIR /app
RUN unzip instantclient-basiclite-linux.x64-18.3.0.0.0dbru.zip \
    && rm instantclient-basiclite-linux.x64-18.3.0.0.0dbru.zip

RUN pip install flask cx_Oracle flask-cors

EXPOSE 5000

ENV ORACLE_HOME=/app/instantclient_18_3
ENV LD_LIBRARY_PATH=$ORACLE_HOME:$LD_LIBRARY_PATH

CMD ["python", "app.py"]
