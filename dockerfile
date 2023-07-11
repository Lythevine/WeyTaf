FROM marwaney/ssh-server

#RUN apt update 
#&& apt install  openssh-server sudo -y

#RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup sshuser

RUN mkdir -p /home/sshuser/.ssh

COPY tafun.pub /home/sshuser/.ssh/authorized_keys

RUN chown sshuser:sshgroup /home/sshuser/.ssh/authorized_keys && chmod 600 /home/sshuser/.ssh/authorized_keys

RUN sudo passwd -d sshuser

RUN usermod -aG sudo sshuser

RUN service ssh start

EXPOSE  22
CMD ["sudo","/usr/sbin/sshd","-D"]