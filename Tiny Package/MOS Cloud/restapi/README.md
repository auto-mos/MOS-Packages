# 1. 개요  
외부 서비스 등에서 MOS Cloud의 데이터 읽기/쓰기 기능을 지원하는 REST API 서버입니다.  
기본적으로 7770번 포트를 사용하므로, 외부 접근 시 해당 포트를 방화벽 설정에서 허용해주셔야합니다.  

# 2. 사용 방법  
본 레포지토리에 업로드된 "제조운영체제 서비스 인터페이스.pdf" 문서를 참고해주세요.  

# 3. 설치 방법  
2023년 12월 8일 이후로 신규로 설치한 MOS Cloud의 경우 기본적으로 REST API가 포함되어있으나,  
이전에 설치된 MOS Cloud라면 아래 방법을 통해 새로 설치해주시기 바랍니다.  

### - AMQP 계정 생성  
```
rabbitmqctl add_user restapi restapi  
rabbitmqctl set_user_tags restapi management  
rabbitmqctl set_permissions -p / restapi ".*" ".*" ".*"  
```
### - 필요 Python 패키지 설치  
```
python -m pip install pika
python -m pip install flask  
```
### - REST API 파일 및 서비스 설치
```
wget https://github.com/auto-mos/MOS-Packages/raw/main/Tiny%20Package/MOS%20Cloud/restapi/restapi.tar  
tar xvf restapi.tar  
mv restapi.py restapi.sh /opt/bin  
mv restapi.service /usr/lib/systemd/system/
systemctl daemon-reload  
systemctl enable restapi.service  
systemctl restart restapi.service  
```
### - 실행 예
![image](https://github.com/auto-mos/MOS-Packages/assets/114371609/e6902815-7983-4938-8845-39c9b342323a)
