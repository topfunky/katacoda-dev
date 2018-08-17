curl -L http://assets.joinscrapbook.com/unzip -o ~/.bin/unzip
chmod +x ~/.bin/unzip

curl -L -o ~/consul.zip https://releases.hashicorp.com/consul/0.9.0/consul_0.9.0_linux_amd64.zip
unzip -d  ~/.bin/ ~/consul.zip
chmod +x ~/.bin/consul

curl -L -o ~/nomad.zip https://releases.hashicorp.com/nomad/0.6.0/nomad_0.6.0_linux_amd64.zip
unzip -d  ~/.bin/ ~/nomad.zip
chmod +x  ~/.bin/nomad

rm ~/nomad.zip ~/consul.zip

host01_commands=(
"curl -L http://assets.joinscrapbook.com/unzip -o /usr/bin/unzip"
"chmod +x /usr/bin/unzip"
"curl -L -o ~/consul.zip https://releases.hashicorp.com/consul/0.9.0/consul_0.9.0_linux_amd64.zip"
"unzip -d  /usr/bin/ ~/consul.zip"
"chmod +x /usr/bin/consul"
"curl -L -o ~/nomad.zip https://releases.hashicorp.com/nomad/0.6.0/nomad_0.6.0_linux_amd64.zip"
"unzip -d  /usr/bin/ ~/nomad.zip"
"chmod +x  /usr/bin/nomad"
"rm ~/nomad.zip ~/consul.zip"
"mkdir -p ~/log"
"nohup sh -c \"consul agent -dev >~/log/consul.log 2>&1 & nohup nomad agent -dev -bind=0.0.0.0 >~/log/nomad.log 2>&1 &\" &"
"nomad -autocomplete-install"
)

all_commands=$(awk -v sep=' && ' 'BEGIN{ORS=OFS="";for(i=1;i<ARGC;i++){print ARGV[i],ARGC-i-1?sep:""}}' "${host01_commands[@]}")

echo "$all_commands"
ssh root@host01 "$all_commands"
