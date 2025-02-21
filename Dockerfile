FROM nvidia/cuda:12.3.2-runtime-ubuntu22.04

# 기본 패키지 업데이트 및 필수 패키지 설치
RUN apt update && apt upgrade -y \
    && apt install -y python3 python3-pip \
    && apt install -y nvidia-utils-535

WORKDIR /app

COPY . /app


RUN pip install --upgrade pip

RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

RUN pip install --no-cache-dir -r requirements.txt

CMD ["bash"]
