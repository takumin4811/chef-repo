#!/bin/sh

if [ $# -ne 1 ]; then 
 echo "ターゲットを指定してください"
 exit 1
fi

if [ -d ./$1 ]; then 
	echo "既に対象は存在します"
	exit 1
fi



mkdir $1
cp ./vagrant-template/Vagrantfile ./$1
cp ./vagrant-template/vagrant-provision.sh ./$1

echo "ディレクトリ./$1を作成しました"
exit 0


