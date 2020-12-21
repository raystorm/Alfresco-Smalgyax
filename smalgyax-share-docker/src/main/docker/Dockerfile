FROM ${docker.share.image}:${alfresco.share.version}

ARG TOMCAT_DIR=/usr/local/tomcat

# Copy Dockerfile to avoid an error if no JARs exist
COPY Dockerfile extensions/*.jar $TOMCAT_DIR/webapps/share/WEB-INF/lib/

# Copy Dockerfile to avoid an error if no AMPs exist
COPY Dockerfile extensions/*.amp $TOMCAT_DIR/amps_share/
RUN java -jar $TOMCAT_DIR/alfresco-mmt/alfresco-mmt*.jar install \
              $TOMCAT_DIR/amps_share $TOMCAT_DIR/webapps/share -directory -nobackup -force

COPY share-config-custom.xml $TOMCAT_DIR/shared/classes/alfresco/web-extension

COPY log4j.properties $TOMCAT_DIR/webapps/share/WEB-INF/classes
COPY hotswap-agent.properties $TOMCAT_DIR/webapps/share/WEB-INF/classes

#UTF-8 for AJP special character support
RUN sed -i "s/\  <Connector port=\"8009\" protocol=\"AJP/1.3\" redirectPort=\"8443\" />/  <Connector port=\"8009\" protocol=\"AJP/1.3\" redirectPort=\"8443\"  URIEncoding=\"UTF-\8" /> /g" /usr/local/tomcat/conf/server.xml
