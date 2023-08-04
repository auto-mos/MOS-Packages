# 1. 개요  
본 문서는 MOS Tiny Package의 구성요소인 MOS Edge 설치 후 기능동작 점검 방법을 설명한 문서입니다.  
  
# 2. 점검 방법  
  - admin:~/sharedFolder/gateway.config 파일의 gatewayName 항목을 "MOS_GW" 로 변경합니다.  
  ![image](https://github.com/auto-mos/MOS-Packages/assets/114371609/78e1d025-f35d-4dd7-878b-46276a22e810)  
  - 본 레포지토리에 있는 engineering.csv , syscfg.json , nodeset.xml 파일을 admin:~/ 디렉토리에 위치시킨 후 copyToOPC.sh 파일을 이용하여 OPCUA 컨테이너로 파일을 복사합니다.  
  - 다운로드 명령어는 아래와 같습니다.  
    ```wget https://github.com/auto-mos/MOS-Packages/raw/main/Tiny%20Package/MOS%20Edge/Verification/engineering.csv```  
    ```wget https://github.com/auto-mos/MOS-Packages/raw/main/Tiny%20Package/MOS%20Edge/Verification/nodeset.xml```  
    ```wget https://github.com/auto-mos/MOS-Packages/raw/main/Tiny%20Package/MOS%20Edge/Verification/syscfg.json```  
  ![image](https://github.com/auto-mos/MOS-Packages/assets/114371609/3950de3e-230a-452d-9332-979ef863084b)  
  - 웹 대시보드 좌측 하단의 "인증서" 버튼을 누른 후 아래 명령어를 통해 OPCUA 컨테이너를 재실행합니다.  
    ``` docker restart opcuaModule ```
  - 웹 대시보드 좌측 하단 Aggregation Server 항목의 "InfoModel file, engineering file, syscfg file, X.509 Cert 항목 값이 모두 "True"임을 확인합니다.  
  - 웹 대시보드 우측 상단 Control 항목의 Data rcv rate(mps) 지표를 통해 데이터가 수집됨을 확인할 수 있습니다. (기본 6)  
    ![image](https://github.com/auto-mos/MOS-Packages/assets/114371609/c35204d5-09da-411c-8743-1d36d0240a2c)


※ syscfg.json 파일의 접속정보를 통해 접근 가능한 데이터 서버는 테스트를 위한 임시 서버로, 기능동작 점검이 완료되면 트래픽 안정화를 위해 접속을 종료해주시기 바랍니다.  
![image](https://github.com/auto-mos/MOS-Packages/assets/114371609/092e56ff-961c-48ed-ba9d-281f47f0686d)  
