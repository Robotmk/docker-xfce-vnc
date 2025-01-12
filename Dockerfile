FROM consol/debian-xfce-vnc


# Switch to root user to install additional software
USER 0

RUN apt-get install -y keepassxc tasque && apt-get clean

COPY files/keepass.file /headless/Documents/keepass.file
RUN chown 1000:1000 /headless/Documents/keepass.file


## switch back to default user
USER 1000