# Sử dụng image Java 17 từ OpenJDK
FROM openjdk:17-jdk-slim

# Cài đặt Maven
RUN apt-get update && apt-get install -y maven

# Sao chép mã nguồn của bạn vào container
COPY . /app

# Thiết lập thư mục làm việc
WORKDIR /app

# Chạy Maven build
RUN mvn clean install

# Mở port cho ứng dụng nếu cần
EXPOSE 8080

# Chạy ứng dụng của bạn (cập nhật lệnh này theo ứng dụng của bạn)
CMD ["java", "-jar", "target/lab-api-0.0.1-SNAPSHOT.jar"]
RUN java -version
RUN mvn -v

