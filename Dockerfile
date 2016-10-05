FROM tomcat:jre8
ENV CATALINA_OPTS "-Djava.security.egd=file:/dev/./urandom -Drepo.bootstrap=true -Drepo.config=file:/usr/local/tomcat/conf/repository.xml -Djava.rmi.server.hostname=127.0.0.1 "
ENV JAVA_ENDORSED_DIRS "/usr/local/tomcat/endorsed"

ADD target/myhippoproject-1.0.1-SNAPSHOT-distribution.tar.gz /usr/local/tomcat/
ADD conf/catalina.properties  /usr/local/tomcat/conf