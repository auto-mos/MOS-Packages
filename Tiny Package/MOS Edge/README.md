# 1. 개요  
본 문서는 MOS Tiny Package의 구성요소인 MOS Edge 설치 방법에 대해 설명합니다.  

# 2. 솔루션 설치 환경  
MOS Edge 솔루션은 *Ubuntu 20.04 LTS, intel CPU* 환경에서 제작 및 실행 테스트 진행되었습니다.  

권장 사양 및 기본 환경 구성은 다음과 같습니다.  
  
## PC 권장 사양  
* Processor : i5 이상의 멀티코어 CPU  
* Memory : 16GB DRAM  
* Disk : 128GB 이상의 SSD 디스크  
* Network : 2개 이상의 LAN 포트  
* OS : *Linux Debian 10*, *Ubuntu 20.04 LTS* 또는 기타 리눅스 기반 OS (MS Windows 미지원)  
* Python 3.6 또는 3.7 버전 설치된 환경에서 정상적으로 동작합니다.  
  
## 네트워크 정책  
본 솔루션은 별도의 네트워크 방화벽 정책 추가를 필요로 합니다. 그 정보는 다음과 같습니다.  
* **inbound 포트 허용 정책**  
> OPCUA(4840), Edge Web(5000), tsDB Web(5001), SSH(22)  
* **Outbound 허용 정책**    
> REST http(80), MQTT(1883), https(443), AMQP(5672)  
  
## 기본 환경 구성  
본 솔루션 설치에 앞서 기본적인 설정이 필요하며, 그 방법은 다음과 같습니다.  
  
### 1. 사용자 계정 생성  
아래 명령어를 이용해 사용자 계정을 생성합니다  
```admin@gateway:\~$ sudo adduser admin```  
  ※ Hostname : gateway  
  
### 2. 계정 권한 설정  
아래 명령어를 이용해 사용자의 권한을 설정합니다.  
**[1]** admin@gateway:\~$ sudo usermod –aG sudo admin  
**[2]** admin@gateway:\~$ sudo visudo 입력 후 파일 맨 아래에 다음 내용을 추가합니다.  
```admin ALL=NOPASSWD:ALL```  
![image](https://github.com/auto-mos/MOS-Packages/assets/114371609/3d70184c-8461-478d-bdab-6e35122b9f8d)  
  
### 3. 리눅스 초기 셋업  
아래 명령어를 입력하여 호스트 이름을 설정합니다.  
```admin@gateway:\~$ sudo vi /etc/hostname 내용을 gateway로 수정```  
```admin@gateway:\~$ sudo vi /etc/hosts```  
> 아래 사진과 같이 기존 호스트 이름을 gateway로 수정합니다.  
![image](https://github.com/auto-mos/MOS-Packages/assets/114371609/358653c1-710c-41ad-a9ac-a66c114329d0)  
  
### 4. 네트워크 셋업  
**[1]** 아래 명령어를 이용해 이더넷 인터페이스 정보를 확인합니다.  
```admin@gateway:\~$ sudo ifconfig```  
![image](https://github.com/auto-mos/MOS-Packages/assets/114371609/4dde7c19-3f8c-4587-b073-53ab46dbe190)

**[2]** 네트워크 연결에 문제가 있다면 아래 명령어 입력 후 네트워크 설정 파일 내용을 수정합니다.  
```admin@gateway:\~$ sudo vi /etc/network/interfaces```  
```admin@gateway:\~$ sudo vi /etc/netplan/*******.yaml```  
  
아래 그림과 같이 GUI를 이용하여 변경하셔도 됩니다.  
![image](https://github.com/auto-mos/MOS-Packages/assets/114371609/5a3447f1-6323-48fe-b00f-5f0010586605)

※ OS마다 사용하는 설정 파일이 다를 수 있으니 작업하시는 환경에 맞는 파일을 수정해주셔야합니다.  
  
### 5. 네트워크 셋업  
**[1]** 아래 명령어 중 하나를 입력하거나 시스템을 재시작합니다.  
```admin@gateway:\~$ sudo service network-manager restart```  
```admin@gateway:\~$ sudo service networking restart```  

**[2]** 아래 명령어를 입력하여 IP 주소 확인 및 핑 테스트를 실행합니다.  
* IP주소 확인  
```admin@gateway:\~$ sudo ifconfig```  
* 핑 테스트  
```admin@gateway:\~$ ping 8.8.8.8```  
![image](https://github.com/auto-mos/MOS-Packages/assets/114371609/326fa7f8-a5de-4178-9080-3fb561eb3f4f)  

**[3]** 아래 명령어를 입력하여 apt 파일 저장소 리스트를 업데이트합니다.  
```admin@gateway:\~$ sudo apt-get update```  

### 6. 솔루션 설치 및 설정 작업  
**[1]** 아래 명령어를 차례로 입력하여, 본 레포지토리의 패키지 파일 다운로드 작업을 진행합니다.  
```cd  /home/admin```  
```curl -LO https://github.com/auto-mos/MOS-Packages/raw/main/Tiny%20Package/MOS%20Edge/edgeInstallPackage_v2.tar```  

**[2]** 아래 명령어를 입력하여 패키지 파일의 압축을 해제합니다.  
```tar -xvf edgeInstallPackage_v2.tar```  

**[3]** 아래 명령어를 입력하여 설치 작업용 스크립트를 실행합니다.  
``` ./edgeInstallPackage_v2/install_Edge.sh ```  

**[4]** 이후 아래 명령어를 차례로 입력하여 암호 파일을 편집합니다.  
```cd sharedFolder/security```  
```./dna_encrypt admin.secured```  
```./dna_encrypt opcua.secured```  
```./dna_encrypt amqp.secured```  
```./dna_encrypt regiKey.secured```  

### 7. MOS Edge ↔ MOS Cloud 등록  
**\[6. 솔루션 설치 및 설정 작업\] 까지 진행하셨으면 MOS Edge 설치는 완료된 것입니다.**  
**MOS Cloud의 설치가 완료되었다면 아래 절차를 수행하여 등록절차를 진행하시면 됩니다.**  
**[1]** 웹 브라우저를 이용하여 MOS Edge 웹 대시보드로 이동합니다.  
```http://[IP주소]:5000```  
**[2]** 우측 상단 Control 메뉴의 '등록' 버튼을 클릭합니다.  
![image](https://user-images.githubusercontent.com/82207645/161478661-582eecb4-172d-410e-9e75-a4374b73ffac.png)  
**[3]** MOS Cloud 서버 IP, MOS Edge ID, MOS Cloud 등록 키, DB 사용 여부를 입력한 후 'Register' 버튼을 클릭합니다.  
__※ MOS Cloud에서 MOS Edge 접속을 위한 RabbitMQ 계정 생성 시, ID와 PW를 각각 엣지게이트웨이 ID와 클라우드 등록 키로 설정해주세요.__  
![image](https://user-images.githubusercontent.com/82207645/161464501-c5ca8b7e-af73-4079-b426-dedfd9ce7e7e.png)  
- 정상 등록 시 아래와 같은 메시지가 출력됩니다.  
![image](https://user-images.githubusercontent.com/82207645/161473940-6c72ccd8-8a88-4223-9038-552e03054de9.png)  
**[4]** 이후 Data rcv rate(mps) 항목을 통해 데이터가 수집되고있음을 확인하실 수 있습니다.  
![image](https://user-images.githubusercontent.com/82207645/161475597-5a4a63f9-2c4d-43f2-937a-738ce6fbac3c.png)  
**본 절차까지 정상적으로 진행되었으면 MOS 클라우드 2D 대시보드에서도 데이터가 수집됨을 확인하실 수 있습니다.**  
※ 등록 절차가 정상적으로 수행되지않더라도 AAS 변환파일을 직접 OPCUA 모듈에 업로드하여 데이터 수집 절차 진행이 가능합니다. 자세한 절차는 매뉴얼 파일에 나와있으니 참고바랍니다.  


### 8. 추가된 기능  
- 웹 대시보드 로그인 패스워드 변경 기능이 추가되었습니다.  
![image](https://user-images.githubusercontent.com/82207645/161477117-364cfe60-76ab-4cb2-ac12-ea92e9a371c5.png)  
- MOS Edge 설정 및 동작 초기화 기능이 추가되었습니다.  
![image](https://user-images.githubusercontent.com/82207645/161477288-10a0761b-a565-417f-87f7-0119d40c17db.png)  
- 전체적인 데이터 카운트 숫자 초기화 기능이 추가되었습니다.(Aggregation Server의 Data Sending, Queue Full 등)  
![image](https://user-images.githubusercontent.com/82207645/161477420-f45a7d49-0313-4606-8e67-3f14eb3d496d.png)  
- copyFromOPC.sh 파일을 이용해 opcuaModule 내 syscfg.json, nodeset.xml, engineering.csv 파일을 홈 디렉토리에 복사할 수 있습니다.  
![image](https://user-images.githubusercontent.com/82207645/210957031-69780b10-76b0-4998-9773-e1345560a0bd.png)  
- copyToOPC.sh 파일을 이용해 설정 파일을 opcuaModule내 설정 파일 위치로 복사할 수 있습니다.  
![image](https://user-images.githubusercontent.com/82207645/210957272-8cd152da-5000-45bd-bfe9-1a4e6fb30ad0.png)  
- 설치 후 게이트웨이 웹 대시보드가 정상적으로 실행되지 않는다면 auxiliaryInstall.sh 실행 후 게이트웨이 웹 서비스를 재실행해주세요.  
![image](https://user-images.githubusercontent.com/82207645/210957839-91f731f9-ff0a-470e-a8e7-5fb6c7bf92a3.png)  
``` sudo systemctl restart gatewayWeb.service```  

## 솔루션 설치는 본 Repository의 다음 문서를 참고하여 진행합니다.  
* [**MOS Edge Manual**](https://github.com/auto-mos/MOS-Packages/blob/main/Tiny%20Package/MOS%20Edge/MOS%20Edge%20Manual.pdf)  
## 설치 시 필요한 사전 정보는 아래와 같습니다.  
**설치용 gatewayHostPackage 파일명**  
* [**gatewayHostPackage_v2.tar**](https://github.com/auto-mos/MOS-Packages/blob/main/Tiny%20Package/MOS%20Edge/gatewayHostPackage_v2.tar) : 본 Repository에 업로드되어있습니다.  
  
**Docker pull용 appliation images 명**  
* control    	:	nestfield/controlmodule:220101  
* opcuamodule	:	nestfield/opcuamodule:220101  
* (optional)tsDB	    	:	machbase/machbase:6.1.15  
* broker	  	:	eclipse-mosquitto:1.6.12  
* monitor 		:	nicolargo/glances:3.1.6.1   
  
**설치 시 사용되는 최소한의 Linux 명령어**  
* ls, cd , pwd, cp, cat, nano, vi, ifconfig, tar  
* sudo apt-get update  
* sudo apt-get upgrade  
  
## 도커 OPCUA Module과 Control Module 이미지는 Docker Hub에 업로드되어있습니다.   
* [OPCUA Module](https://hub.docker.com/repository/docker/nestfield/opcuamodule)  
* [Control Module](https://hub.docker.com/repository/docker/nestfield/controlmodule)  
