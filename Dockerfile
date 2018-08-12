FROM lucasko/springboot

COPY . /opt

ENTRYPOINT ["java", "-jar", "/opt/target/app-1.0.jar"]


