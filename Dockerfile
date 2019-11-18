FROM java:openjdk-8-jdk

ENV MULE_HOME /opt/mule

RUN cd ~ && wget https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/4.2.1/mule-standalone-4.2.1.tar.gz

RUN cd /opt && tar xvzf ~/mule-standalone-4.2.1.tar.gz && rm ~/mule-standalone-4.2.1.tar.gz && ln -s /opt/mule-standalone-4.2.1 /opt/mule

VOLUME ["/opt/mule/logs", "/opt/mule/apps", "/opt/mule/conf"]

WORKDIR $MULE_HOME

CMD ["/opt/mule/bin/mule"]

EXPOSE 8081-8085