# 1단계: 빌드 스테이지 (Gradle과 JDK 전체 포함)
FROM gradle:8-jdk21 AS build
WORKDIR /app
COPY . .
# Gradle 빌드 수행 (테스트 제외 시 -x test)
RUN gradle clean build -x test

# 2단계: 실행 스테이지 (배포용 가벼운 이미지)
FROM rockylinux:9-minimal
RUN microdnf install -y java-21-openjdk-headless tzdata && microdnf clean all

# 보안을 위한 실행 계정 생성
RUN useradd -m spring
USER spring
WORKDIR /home/spring

# 1단계에서 빌드된 jar 파일만 쏙 가져오기
COPY --from=build /app/build/libs/*.jar app.jar

ENV TZ=Asia/Seoul
ENTRYPOINT ["java", "-jar", "app.jar"]