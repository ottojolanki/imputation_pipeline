FROM ubuntu@sha256:e9ce21fab6df25d31849cbe58980459454c3c70cbe53ec2c8a87313635cb039a

RUN apt-get update 
	

RUN mkdir /software
WORKDIR /software
ENV PATH="/software:${PATH}"
