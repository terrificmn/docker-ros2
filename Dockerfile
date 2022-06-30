FROM osrf/ros:foxy-desktop

RUN apt-get update -y

RUN apt-get install -y ros-foxy-gazebo-* \
    ros-foxy-cartographer \
    ros-foxy-cartographer-ros

RUN apt-get install ros-foxy-navigation2 -y \
    ros-foxy-nav2-bringup

RUN apt-get install ros-foxy-dynamixel-sdk -y \
    ros-foxy-turtlebot3-msgs \
    ros-foxy-turtlebot3 

RUN apt-get install -y software-properties-common \
    vim

RUN rm -rf /var/lib/apt/lists/*

## user 만드는 것이랑 HOME 및 USER 지정
## 잘됨~ 권한 때문에 일단 root 로 진행
# # Create user "ros"
# RUN useradd -m ros && \
#     cp /root/.bashrc /home/ros/ && \
#     mkdir /home/ros/workspace && \
#     chown -R --from=root ros /home/ros
# ######
# # # HOME 지정해주고 USER도 지정
# ENV HOME /home/ros
# USER ros
# # WORKDIR ${HOME}/workspace
###############

### $ROS_DISTRO는 foxy 
## source 하는 것에는 turtlebot3 관련
RUN echo 'source /opt/ros/$ROS_DISTRO/setup.bash' >> ~/.bashrc && \
    echo 'source /root/my_ws/install/setup.bash' >> ~/.bashrc && \
    echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc && \  
    echo 'source ~/.bashrc'

# 터틀봇3 테스트 위한 Dockerfile임 
# 여기까지는 잘됨  Mar 10 2022
# docker-compose 에서 따로 커맨드를 설정해놓은것은 없음
# ros2가 되면서 roscore 명령어는 없어짐

# xhost + local:docker 터미널에 실행해주면 도커 컨테이너에서 host의 자원사용가능 (그래픽화면 띄우는 것 가능)
# docker-compose up을 실행하게 되면 foreground로 작업 실행되는 듯하다
# 다른 터미널 열어서 컨테이너로 들어가면 됨

## AMD 그래픽카드가 잘 설치되어 있는 경우에는 전에 ROS 용 Dockerfile 에서 사용했던
## AMD용 설치하는 것은 필요없는 것 확인함 - 20Mar 2022
