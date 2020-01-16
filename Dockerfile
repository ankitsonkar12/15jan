
FROM ubuntu:latest
FROM tomcat
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.16/bin/apache-tomcat-8.5.16.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.16/* /usr/local/tomcat/
copy /target/ci-pipeline-pragra-0.0.1.jar /usr/local/tomcat/webapps/ci-pipeline-pragra-0.0.1.jar
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
copy /target/ci-pipeline-pragra-0.0.1.jar /usr/local/tomcat/webapps/ci-pipeline-pragra-0.0.1.jar
