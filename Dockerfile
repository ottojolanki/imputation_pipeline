FROM ubuntu@sha256:e9ce21fab6df25d31849cbe58980459454c3c70cbe53ec2c8a87313635cb039a

RUN apt-get update && apt-get install -y \
	wget

RUN mkdir /software
WORKDIR /software
ENV PATH="/software:${PATH}"
RUN wget https://mathgen.stats.ox.ac.uk/impute/impute_v2.3.2_x86_64_static.tgz && tar xzvf impute_v2.3.2_x86_64_static.tgz && chmod 755 impute_v2.3.2_x86_64_static/impute2
ENV PATH "/software:/software/impute_v2.3.2_x86_64_static:$PATH"
# SHAPEIT2
RUN cd /opt && \
    wget https://mathgen.stats.ox.ac.uk/genetics_software/shapeit/shapeit.v2.r837.GLIBCv2.12.Linux.static.tgz && \
    mkdir shapeit_v2_r837 && tar -xf shapeit.v2.r837.GLIBCv2.12.Linux.static.tgz -C shapeit_v2_r837 && rm shapeit.v2.r837.GLIBCv2.12.Linux.static.tgz
ENV PATH /opt/shapeit_v2_r837/bin:$PATH
