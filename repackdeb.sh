#!/bin/bash

# Перепаковывает deb файлы 1С в архив opt.tar.xz для построения docker

CLIENT_VERSION=8.3.13-1690

# Каталог скрипта
BASEDIR=$(dirname "$0")

: '
# Удаляем предыдущую распаковку, иначе ошибка при повторе
rm -r -f ${BASEDIR}/deb-unpack/*

# Распаковываем deb
echo "deb unpacking..."
dpkg-deb -R ${BASEDIR}/deb/1c-enterprise83-common_${CLIENT_VERSION}_amd64.deb ${BASEDIR}/deb-unpack/common
dpkg-deb -R ${BASEDIR}/deb/1c-enterprise83-common-nls_${CLIENT_VERSION}_amd64.deb ${BASEDIR}/deb-unpack/common-nls
dpkg-deb -R ${BASEDIR}/deb/1c-enterprise83-server_${CLIENT_VERSION}_amd64.deb ${BASEDIR}/deb-unpack/server
dpkg-deb -R ${BASEDIR}/deb/1c-enterprise83-client_${CLIENT_VERSION}_amd64.deb ${BASEDIR}/deb-unpack/client
dpkg-deb -R ${BASEDIR}/deb/1c-enterprise83-client-nls_${CLIENT_VERSION}_amd64.deb ${BASEDIR}/deb-unpack/client-nls




cp ${BASEDIR}/start1c.sh ${BASEDIR}/deb-unpack/all/opt/1C
chmod +x ${BASEDIR}/deb-unpack/all/opt/1C/start1c.sh 

# Добавляем файл запуска
echo "adding start1c script"
cp ${BASEDIR}/start1c.sh ${BASEDIR}/deb-unpack/common/opt/1C
chmod +x ${BASEDIR}/deb-unpack/common/opt/1C/start1c.sh

'

# Упаковываем в tar
echo "tar packing"
tar -C ${BASEDIR}/deb-unpack/common -cf ${BASEDIR}/opt.tar opt
tar -C ${BASEDIR}/deb-unpack/common-nls -rf ${BASEDIR}/opt.tar opt
tar -C ${BASEDIR}/deb-unpack/server -rf ${BASEDIR}/opt.tar opt
tar -C ${BASEDIR}/deb-unpack/client -rf ${BASEDIR}/opt.tar opt
tar -C ${BASEDIR} -rf ${BASEDIR}/opt.tar opt
