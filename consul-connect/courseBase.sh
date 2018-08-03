curl -L http://assets.joinscrapbook.com/unzip -o ~/.bin/unzip
chmod +x ~/.bin/unzip

curl -L -o ~/consul.zip https://releases.hashicorp.com/consul/1.2.2/consul_1.2.2_linux_amd64.zip
unzip -d  ~/.bin/ ~/consul.zip
rm ~/consul.zip

ssh root@host01 'mkdir -p ~/log && nohup sh -c "consul agent -dev -config-dir=~/config >~/log/consul.log 2>&1 &" &'
ssh root@host02 'echo "HELLO"'
