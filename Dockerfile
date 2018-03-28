FROM kbidarka/fedora-ssh-slave
MAINTAINER https://github.com/kbidarkar

RUN unlink /usr/bin/python ; ln -s /usr/bin/python3 /usr/bin/python
RUN dnf install -y gcc git libffi-devel openssl-devel python3-devel \
    redhat-rpm-config which

COPY / /robottelo/
WORKDIR /robottelo

RUN pip3 install -r requirements.txt

COPY /robottelo/ /home/jenkins/robottelo/

RUN chown -R jenkins:jenkins /home/jenkins/robottelo/

WORKDIR /home/jenkins
