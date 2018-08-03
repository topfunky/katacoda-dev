
host_commands=(
"mkdir -p ~/src"
"cd ~/src && curl -L http://assets.joinscrapbook.com/unzip -o /usr/local/bin/unzip"
"chmod +x /usr/local/bin/unzip"

"cd ~/src && curl -L https://releases.hashicorp.com/consul/1.2.2/consul_1.2.2_linux_amd64.zip -O"
"unzip -d /usr/local/bin ~/src/consul*.zip"

"useradd consul --create-home"
"mkdir -p /home/consul/config"
"mkdir -p /home/consul/log"
"chown -R consul /home/consul"
"runuser -l consul -c \"consul agent -dev -config-dir=/home/consul/config >/home/consul/log/consul.log 2>&1 &\""
)

all_commands=$(awk -v sep=' && ' 'BEGIN{ORS=OFS="";for(i=1;i<ARGC;i++){print ARGV[i],ARGC-i-1?sep:""}}' "${host_commands[@]}")

ssh root@host01 "$all_commands"

# for cmd in "${host_commands[@]}"
# do
#   echo "COMMAND: $cmd"
#   ssh root@host01 "$cmd"
# done
