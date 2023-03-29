#!/bin/sh
mkdir -p ./pbr
cd ./pbr


wget --no-check-certificate -c -O CN.txt https://gaoyifan.github.io/china-operator-ip/china.txt
wget --no-check-certificate -c -O chinanet.txt https://gaoyifan.github.io/china-operator-ip/chinanet.txt
wget --no-check-certificate -c -O cmcc.txt https://gaoyifan.github.io/china-operator-ip/cmcc.txt
wget --no-check-certificate -c -O unicom.txt https://gaoyifan.github.io/china-operator-ip/unicom.txt

{
echo "/ip firewall address-list"

for net in $(cat CN.txt) ; do
  echo "add list=CN address=$net comment=china-all"
done

for net in $(cat chinanet.txt) ; do
  echo "add list=chinanet address=$net comment=china-net"
done

for net in $(cat cmcc.txt) ; do
  echo "add list=cmcc address=$net comment=china-cmcc"
done

for net in $(cat unicom.txt) ; do
  echo "add list=unicom address=$net comment=china-unicom"
done


} > ../CN.rsc

cd ..
rm -rf ./pbr
