FROM maven AS build
RUN git clone https://github.com/ganeshmerwade/Java-project-2.git
WORKDIR /Java-project-2
RUN mvn clean package

FROM tomcat AS deployment
COPY --from=build /Java-project-2/target/*.war /usr/local/tomcat/webapps/
CMD ["catalina.sh" "run"]