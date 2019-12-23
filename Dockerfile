FROM ubuntu@sha256:e9ce21fab6df25d31849cbe58980459454c3c70cbe53ec2c8a87313635cb039a

RUN apt-get update && apt-get install -y \
	wget

RUN mkdir /software
WORKDIR /software
ENV PATH="/software:${PATH}"
RUN wget https://mathgen.stats.ox.ac.uk/impute/impute_v2.3.2_x86_64_static.tgz && tar xzvf impute_v2.3.2_x86_64_static.tgz && chmod 755 impute_v2.3.2_x86_64_static/impute2
ENV PATH="/software:/software/impute_v2.3.2_x86_64_static:${PATH}"
