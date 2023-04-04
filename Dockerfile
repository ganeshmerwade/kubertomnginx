FROM maven:3.8.6-openjdk-11 AS build
RUN git clone https://github.com/ganeshmerwade/javawebapp_withtest.git
WORKDIR /javawebapp_withtest
RUN mvn clean package
CMD [ "/bin/bash" ]

FROM tomcat AS deployment
COPY --from=build /javawebapp_withtest/target/*.war /usr/local/tomcat/webapps/
CMD [ "catalina.sh", "run" ]