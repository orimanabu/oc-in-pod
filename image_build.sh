#!/bin/bash

workdir=./work
mkdir -p work

tarball=openshift-client-linux.tar.gz
if [ ! -f ${workdir}/${tarball} ]; then
	curl https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable-4.11/${tarball} -o ${workdir}/${tarball}
fi
(cd ${workdir} && tar xvf ${tarball})

podman build . --tag quay.io/manabu.ori/test/ubi8-oc
podman push quay.io/manabu.ori/test/ubi8-oc
