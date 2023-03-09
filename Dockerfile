FROM registry.access.redhat.com/ubi8
COPY ./work/oc /usr/local/bin/
#RUN mkdir /work && chgrp 0 /work && chmod 775 /work
#WORKDIR /work
CMD sleep infinity
