FROM centos

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps


EXPOSE 8080
copy /target/ci-pipeline-pragra-0.0.1.jar /usr/local/tomcat/webapps/ci-pipeline-pragra-0.0.1.jar


CMD ["/opt/tomcat/bin/catalina.sh", "run"]


