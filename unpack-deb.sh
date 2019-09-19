#!/bin/bash

CLIENT_VERSION=8.3.13-1690

BASEDIR=$(dirname "$0")

rm -r -f ${BASEDIR}/deb-unpack/*

dpkg-deb -R ${BASEDIR}/deb/1c-enterprise83-common_${CLIENT_VERSION}_amd64.deb ${BASEDIR}/deb-unpack/common

#rm -r ${BASEDIR}/deb-unpack/common-nls/*
dpkg-deb -R ${BASEDIR}/deb/1c-enterprise83-common-nls_${CLIENT_VERSION}_amd64.deb ${BASEDIR}/deb-unpack/common-nls

#rm -r ${BASEDIR}/deb-unpack/common/*
dpkg-deb -R ${BASEDIR}/deb/1c-enterprise83-server_${CLIENT_VERSION}_amd64.deb ${BASEDIR}/deb-unpack/server

dpkg-deb -R ${BASEDIR}/deb/1c-enterprise83-client_${CLIENT_VERSION}_amd64.deb ${BASEDIR}/deb-unpack/client

dpkg-deb -R ${BASEDIR}/deb/1c-enterprise83-client-nls_${CLIENT_VERSION}_amd64.deb ${BASEDIR}/deb-unpack/client-nls


mkdir -p ${BASEDIR}/deb-unpack/all/opt

cp ${BASEDIR}/deb-unpack/common/opt/ ${BASEDIR}/deb-unpack/all/ -r
cp ${BASEDIR}/deb-unpack/common-nls/opt/ ${BASEDIR}/deb-unpack/all/ -r
cp ${BASEDIR}/deb-unpack/server/opt/ ${BASEDIR}/deb-unpack/all/ -r
cp ${BASEDIR}/deb-unpack/client/opt/ ${BASEDIR}/deb-unpack/all/ -r
cp ${BASEDIR}/deb-unpack/client-nls/opt/ ${BASEDIR}/deb-unpack/all/ -r

cp ${BASEDIR}/start1c.sh ${BASEDIR}/deb-unpack/all/opt/1C

chmod +x ${BASEDIR}/deb-unpack/all/opt/1C/start1c.sh
