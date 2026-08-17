#!/bin/sh
loginfo=$(curl -s -L http://192.168.1.1/cgi-bin/luci -X POST -c cookies.txt -d 'username=useradmin&psd=bpmbh')

function myrestart()
{
  mytoken=$(echo $loginfo |sed 's/{/\n/g' | grep token |awk '/realRestart/{print $2}' |sed $'s/\'//g')
  mytoken='token='$mytoken

  curl -s -b cookies.txt http://192.168.1.1/cgi-bin/luci/admin/reboot --data $mytoken
  if [ $? -ne 0 ]; then
    echo $mytoken reboot failed
  else
    echo $mytoken rebooting!
  fi
}
myrestart




# 30 4 */2 * * sleep 5 && sh /usr/bin/Ty_Reboot.sh
# 35 4 */2 * * sleep 5 && ifup wan && ifup wan6

