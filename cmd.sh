# centos 7
# build
docker build -t clion/centos7-cpp-env:0.1 -f Dockerfile.centos7-cpp-env .
# run
docker run -d --cap-add sys_ptrace -p127.0.0.1:2222:22 \
--name clion_remote_env_centos7 clion/centos7-cpp-env:0.1
# ssh save
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "[localhost]:2222"
# 进入shell
docker container exec -it clion_remote_env_centos7 /bin/sh
# 停止docker
docker stop clion_remote_env_centos7


# ubuntu 20.04
# build
docker build -t clion/remote-cpp-env:0.5 -f Dockerfile.remote-cpp-env .
# run
docker run -d --cap-add sys_ptrace -p127.0.0.1:2222:22 \
--name clion_remote_env clion/remote-cpp-env:0.5
# ssh save
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "[localhost]:2222"
# 进入shell
docker container exec -it clion_remote_env /bin/sh
# 停止docker
docker stop clion_remote_env


# apk