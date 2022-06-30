# docker ROS2
ros2 foxy docker, turtlebot3 패키지 설치

## docker-compose.yaml 파일
1. ros2 컨테이너 volumes 부분 원하는 경로로 설정해주기    
현재 디렉토리의 my_ws 가 ros 워크스페이스로서 도커 컨테이너의 /root/my_ws 로 연결   
추후 env 파일에 환경 변수로 사용으로 변경 -  (update 예정)   

2. 현재는 root로 사용하는데 유저로 만들려면 Dockerfile의 user만드는 부분 주석해제 후 build 하기   

3. devices 부분은 /dev 의 장치를 다 연결했는데 필요시 원하는 장치만 연결 후 테스트 해 볼 것

## Dockerfile 은 foxy-desktop 버전  
1. 현재 turtlebot3 에 맞춰서 패키지가 설치되게 되어 있음~   
터틀봇3를 사용안하는 경우에는 아래 코드 지우기 (RUN 코드 자체를 지우면 됨)   
- ros-foxy-gazebo-* 
- ros-foxy-cartographer 
- ros-foxy-cartographer-ros
- ros-foxy-navigation2 
- ros-foxy-nav2-bringup
- ros-foxy-dynamixel-sdk
- ros-foxy-turtlebot3-msgs
- ros-foxy-turtlebot3   

2. 따로 유저를 만들 시에는 RUN useradd -m 부분을 주석해제하고 사용 / 테스트 필요     
source 하는 부분도(turtlebot3) 필요 없을 시 삭제 및 주석처리

## gitignore
my_ws 디렉토리가 생략 되어 있음 - 원하는 워크스페이스 디렉토리를 만들고 docker-compose.yaml 에서 연결하기  
디렉토리명을 바꿀 시 gitignore도 변경하기

