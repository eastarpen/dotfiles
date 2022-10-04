# add these script fragments to your .bashrc or .zshrc or other shell profile

# whether npm exists
npm_exist=true

if ! command -v npm &> /dev/null
then
    $npm_exist=false
fi

# proxy settings
function proxy_on() {
    # check whether this system is wsl2
    if uname -r |grep -iq "WSL2";
    then
        export winip=`ipconfig.exe| grep 'Wi-Fi' -A 1000| grep 'IPv4 Address' -m 1| cut -d":" -f 2|sed -e 's/\s*//g'`
    fi
    # clash port
    address="http://$winip:7890"
    export http_proxy=$address
    export https_proxy=$address
    # git
    git config --global http.proxy $address
    git config --global https.proxy $address
    # npm
    if [ "$npm_exist" = true ]; then
        npm config set proxy $address
        npm config set https-proxy $address
    fi
    echo -e "proxy address $address"
}

function proxy_off(){
    unset http_proxy https_proxy
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    npm config delete proxy
    npm config delete https-proxy
    # npm
    if [ "$npm_exist" = true ]; then
        npm config delete proxy
        npm config delete https-proxy
    fi

    echo -e 'proxy unset!'
}

# open proxy_on defaulted
proxy_on() > nul
