curl -L http://assets.joinscrapbook.com/unzip -o ~/.bin/unzip
chmod +x ~/.bin/unzip

curl -L -o ~/consul.zip https://releases.hashicorp.com/consul/1.2.2/consul_1.2.2_linux_amd64.zip
unzip -d  ~/.bin/ ~/consul.zip
rm ~/consul.zip

mv ~/assets/bin/* ~/.bin
chmod +x ~/.bin/*

ssh root@host01 "curl -L http://assets.joinscrapbook.com/unzip -o /usr/bin/unzip && chmod +x /usr/bin/unzip && curl -L -o ~/consul.zip https://releases.hashicorp.com/consul/1.2.2/consul_1.2.2_linux_amd64.zip && unzip -d  /usr/bin/ ~/consul.zip && rm ~/consul.zip && mv ~/assets/bin/* ~/.bin && chmod +x ~/.bin/*"
ssh root@host01 "mkdir -p ~/log && nohup sh -c \"consul agent -dev -config-dir=~/assets/etc/consul.d >~/log/consul.log 2>&1 &\" &"
