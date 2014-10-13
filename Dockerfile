# sshd
#
# VERSION               0.0.1

FROM     ubuntu:14.04
MAINTAINER Pengfei.Shi <shipengfei92@gmail.com>

RUN sed -e "s/archive.ubuntu.com/ftp.sjtu.edu.cn/g" /etc/apt/sources.list &&apt-get update && apt-get install -y openssh-server
#RUN sed -e '/archive.ubuntu.com/ ftp.sjtu.edu.cn/g'/etc/apt/source.list
#iRUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:1' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
