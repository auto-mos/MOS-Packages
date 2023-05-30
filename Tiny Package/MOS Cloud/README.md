# 1. 개요  
소규모 제조기업을 대상으로 하는 MOS Tiny Package : Cloud 설치 가이드 문서입니다.  

# 2. MOS 설치 환경  
본 MOS Tiny Package 시험 설치 및 동작은 Ubuntu 20.04.4 Cloud 이미지로 구축한 환경에서 진행되었습니다.  
![image](https://user-images.githubusercontent.com/114371609/228399978-e0a10077-4d26-4d6e-833d-694fdbe32c34.png)  

권장 사양 및 기본 환경 구성은 다음과 같습니다.  
## PC 권장 사양  
* Processor : 8코어 이상의 CPU  
* Memory : 32GB  
* Disk :
  - Root 파일시스템 : 100GB
  - 시계열DB 저장용 스토리지 : 400GB
  - 백업용 블록 스토리지 : 1TB
* OS : Ubuntu 20.04 LTS  
  
## 네트워크 정책  
본 솔루션은 별도의 네트워크 방화벽 정책 추가를 필요로 합니다. 그 정보는 다음과 같습니다.  
* **inbound 포트 허용 정책**  
> SSH(22), http(80), https(443), AMQP(5672), InfluxDB(8086)  
* **Outbound 허용 정책**    
> OPCUA(4840)
  
## 기본 환경 구성  
모든 설치/동작 과정 및 이후 솔루션 운용은 Root 계정을 통해 진행됩니다.
Root 권한 접속은 아래 명령어를 통해 가능합니다.  
```sudo su```  
![image](https://user-images.githubusercontent.com/114371609/228400702-22254e6e-df5c-4d0b-bc66-75e9d089734c.png)  

본 레포지토리에 있는 두 압축파일(MOSpackage_apps.tar.gz, MOSpackage_install.tar.gz)을 /opt 디렉토리 아래에 배치합니다.  
아래 명령어를 이용해 다운로드 가능합니다.  
```wget https://github.com/auto-mos/MOS-Packages/raw/main/Tiny%20Package/MOS%20Cloud/MOSpackage_apps.tar.gz```  
```wget https://github.com/auto-mos/MOS-Packages/raw/main/Tiny%20Package/MOS%20Cloud/MOSpackage_install.tar.gz```  
만약 해당 디렉토리가 없다면 아래 명령어를 통해 디렉토리를 생성해주세요.  
```mkdir /opt```  

압축해제 명령어를 통해 두 압축파일의 압축을 풀어줍니다.  
```gunzip ./*.gz```  
![image](https://user-images.githubusercontent.com/114371609/228401640-93f69d96-118d-4710-83d3-fe3d8d11fbdf.png)

```tar xvf ./MOSpackage_apps.tar```  
```tar xvf ./MOSpackage_install.tar```  
![image](https://user-images.githubusercontent.com/114371609/228401851-19668232-f36c-4668-8d11-022cb8cd8831.png)

이후 기본 패키지 설치 및 환경 설정, 동작 과정은 첨부되어있는 설치 가이드 문서 참고바랍니다.
