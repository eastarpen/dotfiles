# add these script fragments to your .bashrc or .zshrc or other shell profile

# check whether this system is wsl2
if uname -r |grep -iq "WSL2";
then
    export winip=`ipconfig.exe | grep 'Wireless LAN adapter Wi-Fi' -A6 | cut -d":" -f 2| tail -3| head -1| sed -e 's/\s*//g'`

    # thanks for this blog 
    # https://pscheit.medium.com/get-the-ip-address-of-the-desktop-windows-host-in-wsl2-7dc61653ad51
fi

# proxy settings
function proxy_on() {
    # clash port
    address="http://$winip:7890"
    export http_proxy=$address
    export https_proxy=$address
    git config --global http.proxy $address
    git config --global https.proxy $address
    echo -e "proxy address $address"
}

function proxy_off(){
    unset http_proxy https_proxy
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    echo -e 'proxy unset!'
}

# open proxy_on defaulted
proxy_on() > nul
