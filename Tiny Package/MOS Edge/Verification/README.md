# 1. 개요  
본 문서는 MOS Tiny Package의 구성요소인 MOS Edge 설치 후 기능동작 점검 방법을 설명한 문서입니다.  
  
# 2. 점검 방법  
  - admin:~/projects/gateway.config 파일의 gatewayName 항목을 "MOS_GW" 로 변경합니다.  
  ![image](https://github.com/auto-mos/MOS-Packages/assets/114371609/78e1d025-f35d-4dd7-878b-46276a22e810)  
  - 본 레포지토리에 있는 engineering.csv , syscfg.json , nodeset.xml 파일을 admin:~/ 디렉토리에 위치시킨 후 copyToOPC.sh 파일을 이용하여 OPCUA 컨테이너로 파일을 복사합니다.  
  ![image](https://github.com/auto-mos/MOS-Packages/assets/114371609/3950de3e-230a-452d-9332-979ef863084b)  
  - 웹 대시보드 좌측 하단의 "인증서" 버튼을 누른 후 아래 명령어를 통해 OPCUA 컨테이너를 재실행합니다.  
    ``` docker restart opcuaModule ```
  - 웹 대시보드 좌측 하단의 "InfoModel file, engineering file, syscfg file, X.509 Cert 항목 값이 모두 "True"임을 확인합니다.  
     "Data Sending" 항목을 통해 실시간으로 데이터가 수집되는 모습을 확인하실 수 있습니다.  
  ![image](https://github.com/auto-mos/MOS-Packages/assets/114371609/05713bc9-0552-449b-bd82-b1edbd84bb17)  


