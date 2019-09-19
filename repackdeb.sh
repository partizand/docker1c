#!/bin/bash

# Перепаковывает deb файлы 1С в архив opt.tar.xz для построения docker
# Для использования положите все необходимые для установки файлы в каталог ./deb
# Резульатаом будет архив opt.tar.xz с содержимым /opt установленной 1С

#CLIENT_VERSION=8.3.13-1690

# Каталог скрипта
BASEDIR=$(dirname "$0")

FILENAME_TAR=opt.tar
FILENAME_TARXZ=opt.tar.xz

# Удаляем предыдущую распаковку, иначе ошибка при повторе
#rm -r -f ${BASEDIR}/deb-unpack/*

# Создаем начальный tar со скриптом запуска
echo "tar init"
rm -f ${BASEDIR}/${FILENAME_TAR}
rm -f ${BASEDIR}/${FILENAME_TARXZ}

chmod +x ${BASEDIR}/opt/1C/start1c.sh 
tar -C ${BASEDIR} -cf ${BASEDIR}/${FILENAME_TAR} opt

# Распаковываем deb
for filename in ${BASEDIR}/deb/*.deb; do

    echo "deb '$filename' processing..."
    
    # Удаляем предыдущую распаковку, иначе ошибка при повторе
    rm -r -f ${BASEDIR}/deb-unpack/*
    
    # Распаковываем
    echo "Unpacking deb..."
    dpkg-deb -R ${filename} ${BASEDIR}/deb-unpack/
    
    # Добавляем в tar
    echo "tar packing"
    tar -C ${BASEDIR}/deb-unpack -rf ${BASEDIR}/${FILENAME_TAR} opt
    
    #dpkg-deb -R ${BASEDIR}/deb/1c-enterprise83-common-nls_${CLIENT_VERSION}_amd64.deb ${BASEDIR}/deb-unpack/common-nls
    #dpkg-deb -R ${BASEDIR}/deb/1c-enterprise83-server_${CLIENT_VERSION}_amd64.deb ${BASEDIR}/deb-unpack/server
    #dpkg-deb -R ${BASEDIR}/deb/1c-enterprise83-client_${CLIENT_VERSION}_amd64.deb ${BASEDIR}/deb-unpack/client
    #dpkg-deb -R ${BASEDIR}/deb/1c-enterprise83-client-nls_${CLIENT_VERSION}_amd64.deb ${BASEDIR}/deb-unpack/client-nls

done

# Сжимаем tar
echo "compressing to xz"
xz -z ${BASEDIR}/${FILENAME_TAR}

exit 0

cp ${BASEDIR}/start1c.sh ${BASEDIR}/deb-unpack/all/opt/1C
chmod +x ${BASEDIR}/deb-unpack/all/opt/1C/start1c.sh 

# Добавляем файл запуска
echo "adding start1c script"
cp ${BASEDIR}/start1c.sh ${BASEDIR}/deb-unpack/common/opt/1C
chmod +x ${BASEDIR}/deb-unpack/common/opt/1C/start1c.sh



# Упаковываем в tar
echo "tar packing"
tar -C ${BASEDIR}/deb-unpack/common -cf ${BASEDIR}/opt.tar opt
tar -C ${BASEDIR}/deb-unpack/common-nls -rf ${BASEDIR}/opt.tar opt
tar -C ${BASEDIR}/deb-unpack/server -rf ${BASEDIR}/opt.tar opt
tar -C ${BASEDIR}/deb-unpack/client -rf ${BASEDIR}/opt.tar opt
tar -C ${BASEDIR} -rf ${BASEDIR}/opt.tar opt
