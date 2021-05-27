#FROM BASEIMAGE
#FROM registry.access.redhat.com/ubi8/ubi-minimal
FROM ubuntu 

ENV USER=couchbase
ENV UID=12345
ENV GID=23456

RUN groupadd -g ${GID} ${USER}


RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/home/$USER" \
    --ingroup "root" \
    --uid "$UID" \
    "$USER"

RUN adduser $USER root
RUN chmod -R 775 /home/$USER/
RUN chown -R $USER:root /home/$USER/


COPY adapter /home/$USER
WORKDIR /home/$USER/

ENTRYPOINT ["/home/couchbase/adapter", "--logtostderr=true"]
