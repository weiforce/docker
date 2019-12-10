FROM centos:7

RUN yum update -y
RUN yum install -y wget dejavu* libreoffice-opensymbol-fonts
RUN wget https://download.onlyoffice.com/install/desktop/docbuilder/linux/onlyoffice-documentbuilder.x86_64.rpm && rpm -ivh onlyoffice-documentbuilder.x86_64.rpm && rm -rf onlyoffice-documentbuilder.x86_64.rpm
