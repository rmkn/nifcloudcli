FROM rockylinux:8
LABEL maintainer "rmkn"

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
RUN yum -y clean all
RUN yum -y update
RUN yum -y install glibc-locale-source

RUN localedef -i ja_JP -f UTF-8 ja_JP.utf8
RUN sed -i -e '/^LANG=/s/=.*$/=ja_JP.utf8/' /etc/locale.conf 
RUN ln -sf /usr/share/zoneinfo/Japan /etc/localtime 

#RUN yum -y install epel-release
#RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8

RUN yum -y install java-1.8.0-openjdk unzip

ARG CLIVER=8.0.2

RUN curl -o /tmp/NIFCLOUD_api-tools.zip -SL https://pfs.nifcloud.com/api/sdk/java8/NIFCLOUD_api-tools_${CLIVER}.zip \
	&& unzip /tmp/NIFCLOUD_api-tools.zip -d /usr/local/ \
	&& chmod 755 /usr/local/NIFCLOUD_api-tools_${CLIVER}/bin/*

ENV NIFTY_CLOUD_HOME=/usr/local/NIFCLOUD_api-tools_${CLIVER}
ENV PATH=$PATH:$NIFTY_CLOUD_HOME/bin
ENV JAVA_HOME=/usr
