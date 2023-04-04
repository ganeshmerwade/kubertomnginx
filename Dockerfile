FROM maven AS build
RUN git clone https://github.com/ganeshmerwade/javawebapp_withtest.git
WORKDIR /javawebapp_withtest
RUN mvn clean package

FROM tomcat AS deployment
COPY --from=build /javawebapp_withtest/target/*.war /usr/local/tomcat/webapps/
CMD ["catalina.sh" "run"]