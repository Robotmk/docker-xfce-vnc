FROM consol/debian-xfce-vnc


# Switch to root user to install additional software
USER 0

RUN apt-get update && apt-get install -y keepassxc && apt-get clean

COPY files/keepass.file /headless/Documents/keepass.file
RUN chown 1000:1000 /headless/Documents/keepass.file

RUN wget https://svn.zdechov.net/vcard-studio/bin/vcard-studio_1.5.0_amd64.deb && dpkg -i vcard-studio_1.5.0_amd64.deb && apt-get install -f && apt-get clean


## switch back to default user
USER 1000