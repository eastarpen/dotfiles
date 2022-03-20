#! /bin/bash

# send msg to telegram bot JDShareCodebot

jd_bean_cmd='/bean 4jvn4pgf5xckacrtb2syvsg7aa'
jd_farm_cmd='/farm fd283b31313a4077a47f1f54c7987374'
jd_pet_cmd='/pet MTE1NDY3NTIwMDAwMDAwNzYxMTg1NDM='

/bin/telegram-cli -We "msg @JDShareCodebot $jd_bean_cmd"
sleep 5s
/bin/telegram-cli -We "msg @JDShareCodebot $jd_pet_cmd"
sleep 5s
/bin/telegram-cli -We "msg @JDShareCodebot $jd_farm_cmd"
sleep 5s
