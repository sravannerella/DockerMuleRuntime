FROM java:openjdk-8-jdk

ENV MULE_HOME /opt/mule

RUN cd ~ && wget https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-embedded-distribution/4.2.1-hf5/mule-embedded-distribution-4.2.1-hf5.jar

RUN cd /opt && jar -xf ~/mule-embedded-distributon-4.2.1-hf5.jar && rm mule-embedded-distribution-4.2.1-hf5.jar && ln -s /opt/mule-embedded-distribution-4.2.1-hf5 /opt/mule

VOLUME ["/opt/mule/logs", "/opt/mule/apps", "/opt/mule/conf"]

WORKDIR $MULE_HOME

CMD ["/opt/mule/bin/mule"]

EXPOSE 8081-8085