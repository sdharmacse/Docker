From ubuntu:16.04

Maintainer dharma@vidyayug.com


LABEL idp.version="3.2.1"

##### 

RUN apt-get update && \
    apt-get install -y net-tools && \
    apt-get install -y iputils-ping && \
    apt-get install -y vim && \
    apt-get install -y curl;

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install -y ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME


## Install Apache2
RUN apt-get install -y apache2 && \ 
    a2enmod  proxy_http && \ 
    a2enmod proxy && \
    a2enmod proxy_ajp && \
    a2enmod ssl && \
    a2enmod rewrite;


ENV APACHE_RUN_USER  www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR   /var/log/apache2
ENV APACHE_PID_FILE  /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR   /var/run/apache2
ENV APACHE_LOCK_DIR  /var/lock/apache2
ENV APACHE_LOG_DIR   /var/log/apache2

RUN mkdir -p $APACHE_RUN_DIR
RUN mkdir -p $APACHE_LOCK_DIR
RUN mkdir -p $APACHE_LOG_DIR

EXPOSE 80

# CMD ["sed", "-n", "74p", "/etc/apache2/apache2.conf"]
# CMD ["cat", "/etc/apache2/envvars"]


### Download tomcat 
ENV CATALINA_HOME /opt/tomcat-8
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

# let "Tomcat Native" live somewhere isolated
ENV TOMCAT_NATIVE_LIBDIR $CATALINA_HOME/native-jni-lib
ENV LD_LIBRARY_PATH ${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$TOMCAT_NATIVE_LIBDIR

### Copy 

COPY tomcat-8 /opt/tomcat-8
COPY commons-dbcp2-2.1.1 /opt/commons-dbcp2-2.1.1
COPY commons-pool2-2.4.3 /opt/commons-pool2-2.4.3
COPY idp /idp 
COPY shibboleth-idp /opt/shibboleth-idp

RUN cp /idp/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN chmod a+x /opt/tomcat-8/bin/*
RUN chmod  -R 777 /opt

RUN keytool -import -trustcacerts -keystore /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/cacerts -storepass changeit -noprompt -alias mycert1 -file /idp/ssl/ldap.vidyayug.com.crt

RUN keytool -import -trustcacerts -keystore /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/cacerts -storepass changeit -noprompt -alias mycert2 -file /idp/ssl/sp.vidyayug.com.crt


CMD ["/opt/tomcat-8/bin/startup.sh", "/usr/sbin/apache2", "-D",  "FOREGROUND"]


