# Bước 1: Sử dụng Maven image để build ứng dụng Java
FROM maven:3.8.4-openjdk-11-slim AS build

# Bước 2: Thiết lập thư mục làm việc trong container
WORKDIR /app

# Bước 3: Copy mã nguồn vào container
COPY . .

# Bước 4: Chạy lệnh Maven để build ứng dụng (tạo file .jar)
RUN mvn clean install

# Bước 5: Sử dụng image OpenJDK để chạy ứng dụng
FROM openjdk:11-jre-slim

# Bước 6: Copy file .jar đã build từ container trước đó
COPY --from=build /app/target/lab-api-0.0.1-SNAPSHOT.jar /app/lab-api.jar

# Bước 7: Chạy ứng dụng Java khi container khởi động
ENTRYPOINT ["java", "-jar", "/app/lab-api.jar"]
