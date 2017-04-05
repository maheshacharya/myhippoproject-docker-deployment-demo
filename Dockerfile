FROM tomcat:jre8
ENV JAVA_ENDORSED_DIRS "/usr/local/tomcat/endorsed"
ENV MAX_HEAP=512
ENV MIN_HEAP=256
ENV JVM_OPTS="-server -Xmx${MAX_HEAP}m -Xms${MIN_HEAP}m -XX:MaxPermSize=192m -XX:NewRatio=2 -XX:SurvivorRatio=6 -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSClassUnloadingEnabled -XX:+CMSParallelRemarkEnabled -XX:CMSFullGCsBeforeCompaction=1 -XX:MaxGCPauseMillis=200"
ENV CLUSTER_ID="2"
ENV RMI_OPTS="-Djava.rmi.server.hostname=127.0.0.1 -Dsun.rmi.dgc.server.gcInterval=604800000 -Dsun.rmi.dgc.client.gcInterval=604800000"
ENV JRC_OPTS="-Dorg.apache.jackrabbit.core.cluster.node_id=${CLUSTER_ID}"
ENV L4J_OPTS="-Dlog4j.configuration=file:/usr/local/tomcat/conf/log4j.xml"
ENV CATALINA_OPTS "${JVM_OPTS} ${REP_OPTS} ${DMP_OPTS} ${RMI_OPTS} ${L4J_OPTS} ${JRC_OPTS} -Djava.security.egd=file:/dev/./urandom  -Drepo.config=file:/usr/local/tomcat/conf/repository.xml -Djava.rmi.server.hostname=127.0.0.1 "

ADD target/myhippoproject-1.0.1-SNAPSHOT-distribution.tar.gz /usr/local/tomcat/
#ADD conf/catalina.properties  /usr/local/tomcat/conf