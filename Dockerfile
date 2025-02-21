# 1. 가벼운 Python 공식 이미지 사용 (Slim 버전)
FROM python:3.11-slim

# 2. 작업 디렉토리 설정
WORKDIR /app

# 3. 필수 시스템 패키지 설치
RUN apt-get update && apt-get install -y \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 4. 로컬 파일을 컨테이너로 복사
COPY . /app

# 5. pip 최신 버전으로 업그레이드 후 라이브러리 설치 (캐시 제거)
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# 6. 개발 환경 유지 (bash로 대기)
CMD ["bash"]
