#!/bin/bash
BASEDIR=$(dirname "$0")

#tar -C /home/andrey/prog/docker/1c-client/deb-unpack/common -cvf opt.tar opt 


cp ${BASEDIR}/start1c.sh ${BASEDIR}/deb-unpack/common/opt/1C
chmod +x ${BASEDIR}/deb-unpack/common/opt/1C/start1c.sh

tar -C ${BASEDIR}/deb-unpack/common -cf ${BASEDIR}/opt.tar opt
tar -C ${BASEDIR}/deb-unpack/common -cf ${BASEDIR}/opt.tar opt

#tar -C ${BASEDIR}/deb-unpack/all -cJf ${BASEDIR}/opt.tar.xz opt

#tar -C /home/andrey/prog/docker/1c-client/deb-unpack/common -cJf opt.tar.xz /home/andrey/prog/docker/1c-client/deb-unpack/common/opt 
