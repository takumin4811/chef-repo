#!/bin/sh

echo ==============================
echo "Vagrant provision shell START"
echo ==============================

yum -y update
yum groupinstall -y "Development Tools"

cp /usr/share/zoneinfo/Japan /etc/localtime
echo "LANG=ja_JP.UTF-8" > /etc/sysconfig/i18n
yum install -y man-pages-ja

echo ==============================
echo "Vagrant provision shell END"
echo ==============================
