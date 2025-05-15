FROM maven AS builder
WORKDIR /app
COPY . .
RUN mvn install package

FROM tomcat:9
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps
