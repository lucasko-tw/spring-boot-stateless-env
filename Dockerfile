FROM lucasko/springboot

COPY . /opt

CMD ["mvn", "spring-boot:run"]


