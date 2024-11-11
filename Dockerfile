FROM tomcat:9-jre9
ADD target/devops.war /usr/local/tomcat/webapps/
