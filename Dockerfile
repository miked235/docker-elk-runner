FROM centos:latest

RUN yum -y update && yum install curl && yum clean -y all

RUN mkdir -p /etc/index-patterns /etc/searches /etc/visualizations /etc/dashboards

ADD scripts/runner-script.sh /runner-script.sh
ADD index-patterns /etc/patterns/ 
ADD searches /etc/searches/ 
ADD visualizations /etc/visualizations/ 
ADD dashboards /etc/dashboards/

RUN chmod +x /runner-script.sh

ENV "ELASTICSEARCH=localhost:9200" \
 	KIBANA_INDEX=".kibana"

ENTRYPOINT ["/runner-script.sh"]
