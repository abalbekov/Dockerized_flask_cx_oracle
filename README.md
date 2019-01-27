
This example creates a Docker image with Python + Flask + cx_oracle + Oracle Instant Client.
The example assumes Docker runtime is already installed.

To run the example :

1. Create new project directory
```
mkdir flask_cx_oracle
cd flask_cx_oracle
```

2. Download Oracle Instant Client v18.3 for Linux x86 from https://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html 
```
instantclient-basiclite-linux.x64-18.3.0.0.0dbru.zip
```
and place it into project directory.

3. Place Dockerfile and app.py file from this example in the project directory.

4. Create docker image named flask_cx_oracle :
```
docker build -t flask_cx_oracle .
```

5. Run container named "app" from image "flask_cs_oracle" :
```
docker run -d --rm --name app -p 5000:5000 --link ora122:oradb flask_cx_oracle
```
where
```
-d,                    : Run container in background
--rm                   : remove the container when it exits
-p 5000:5000           : publish container port 5000 as host port 5000
-- link ora122:oradb   : assuming that target Oracle db is running in another container named "ora122", 
                         make ora122 visible to container "app" under "oradb" alias                        
```  
6. Check application response from within own container:
```
docker exec -it app bash
curl localhost:5000
	Hello, Oracle DB version:12.2.0.1.0
```                              
7. Check application response from host:
```
curl localhost:5000
	Hello, Oracle DB version:12.2.0.1.0
```
-- to send updated app file to running container :
```
docker cp app.py app:/app
```
