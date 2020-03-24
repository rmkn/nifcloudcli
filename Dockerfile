FROM rmkn/centos8
LABEL maintainer "rmkn"

RUN yum -y install java-1.8.0-openjdk unzip

RUN curl -o /tmp/NIFCLOUD_api-tools.zip -SL https://pfs.nifcloud.com/api/sdk/java8/NIFCLOUD_api-tools_8.0.1.zip \
	&& unzip /tmp/NIFCLOUD_api-tools.zip -d /usr/local/ \
	&& chmod 755 /usr/local/NIFCLOUD_api-tools_8.0.1/bin/*

ENV NIFTY_CLOUD_HOME=/usr/local/NIFCLOUD_api-tools_8.0.1
ENV PATH=$PATH:$NIFTY_CLOUD_HOME/bin
ENV JAVA_HOME=/usr
#ENV JAVA_OPTS=-Duser.language=ja
