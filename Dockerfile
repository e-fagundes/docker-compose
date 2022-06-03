#FROM quay.io/wildfly/wildfly:26.0.1.Final
FROM jboss/wildfly:10.1.0.Final
ADD
COPY /topaz/modules/ /opt/jboss/wildfly/modules/
COPY /topaz/standalone/deployments/ /opt/jboss/wildfly/standalone/deployments/
COPY /topaz/standalone/configuration/ /opt/jboss/wildfly/standalone/configuration/
COPY /topaz/standalone/userlibrary/ /opt/jboss/wildfly/standalone/userlibrary/
#COPY /topaz/standalone/conf/ /opt/jboss/wildfly/standalone/conf/
COPY /topaz/bin/runtopaz.sh /opt/jboss/wildfly/bin/runtopaz.sh

USER root

#RUN /opt/jboss/wildfly/bin/add-user.sh admin Admin

RUN mkdir /opt/jboss/wildfly/standalone/log

RUN chmod +x /opt/jboss/wildfly/bin/runtopaz.sh

RUN chown -R jboss:0 /opt/jboss/wildfly 

RUN chmod -R g+rw /opt/jboss/wildfly
#RUN chmod -R 777 /opt/jboss/wildfly

EXPOSE 8080

USER jboss

CMD ["/opt/jboss/wildfly/bin/runtopaz.sh"]
