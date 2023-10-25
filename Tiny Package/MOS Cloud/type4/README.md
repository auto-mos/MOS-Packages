# 1. 개요  
필드 장비로부터 전송되는 MQTT 메시지를 MOS Cloud의 시계열데이터베이스에 저장 기능을 지원하는 인터페이스 소프트웨어입니다.  

# 2. MQTT 메시지 규격  
MOS Cloud에서 처리 가능한 MQTT 규격은 아래와 같습니다.(JSON포맷 사용)  
localtime 값은 Unix timestamp 값을 사용합니다. 0을 넣는다면 데이터 전송 시점의 시간을 자동으로 기록합니다.  
![image](https://github.com/auto-mos/MOS-Packages/assets/114371609/b0c797f7-476d-4e15-83c3-a29d50d34a17)  
{  
    "localtime": "1698218076000000000",  
	"data": [  
	    { "tag" : "sample1", "value":"RUN"},  
		{ "tag" : "sample2", "value":"1"}  
		]  
}    

# 3. 설치 및 실행방법
* MOS Cloud에 설치된 RabbitMQ의 MQTT 플러그인 기능을 활성화합니다.  
```rabbitmq-plugins enable rabbitmq_mqtt```  
* MOS Cloud에 gather_mqtt.tar 파일을 다운로드한 후 압축 해제합니다.  
```wget https://github.com/auto-mos/MOS-Packages/raw/main/Tiny%20Package/MOS%20Cloud/type4/gather_mqtt.tar```  
** 다운로드 시 오류가 발생한다면 아래 명령어를 이용해 다운로드 해주세요.  
```wget https://github.com/auto-mos/MOS-Packages/raw/main/Tiny%20Package/MOS%20Cloud/type4/gather_mqtt.tar --no-check-certificate```  
```tar xvf gather_mqtt.tar```  
* 본 페로지토리에 포함된 gather_mqtt 실행파일을 MOS Cloud의 /opt/bin 디렉토리에 위치시킵니다.  
```mv gather_mqtt /opt/bin/```  
```mv gather_mqtt.sh /opt/bin/```  
* gather_mqtt.service 파일을 /usr/lib/systemd/system/ 디렉토리에 위치시킵니다.  
```mv gather_mqtt.service /usr/lib/systemd/system/```  
* 아래 명령어를 통해 시스템에 서비스를 등록합니다.  
```systemctl enable gather_mqtt```  
  
