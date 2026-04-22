# 1. 실행 환경 구성
FROM eclipse-temurin:21-jre-noble

# 2. 작업 디렉토리 설정
WORKDIR /app

# 3. 빌드된 JAR 파일을 이미지 내부로 복사
# 빌드 결과물 이름을 확인하세요 (demo-0.0.1-SNAPSHOT.jar)
COPY build/libs/demo-0.0.1-SNAPSHOT.jar app.jar

# 4. 보안을 위한 비관리자 실행 (선택 사항이나 권장)
RUN useradd -m myuser
USER myuser

# 5. 앱 실행
ENTRYPOINT ["java", "-jar", "app.jar"]
