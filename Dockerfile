FROM ubuntu:latest
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat/
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget

RUN wget http://muug.ca/mirror/apache-dist/tomcat/tomcat-8/v8.5.50/bin/apache-tomcat-8.5.50.tar.gz
RUN tar xvfz apache-tomcat-8.5.50.tar.gz
RUN mv apache-tomcat-8.5.50/* /opt/tomcat/
WORKDIR /opt/tomcat/webapps
copy /target/ci-pipeline-pragra-0.0.1.jar /opt/tomcat/webapps/ci-pipeline-pragra-0.0.1.jar
EXPOSE 8080
CMD /opt/tomcat/bin/catalina.sh run
