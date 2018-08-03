
host_commands=(
"mkdir -p ~/src"
"mkdir -p ~/tutorial/config"
"cd ~/src && curl -L http://assets.joinscrapbook.com/unzip -o /usr/local/bin/unzip"
"chmod +x /usr/local/bin/unzip"

"cd ~/src && curl -L https://releases.hashicorp.com/consul/1.2.2/consul_1.2.2_linux_amd64.zip -O"
"unzip -d /usr/local/bin ~/src/consul*.zip"

"mkdir -p ~/log"
"nohup sh -c \"consul agent -dev -config-dir=~/config >~/log/consul.log 2>&1 &\" &"
)

for cmd in "${host_commands[@]}"
do
  echo "COMMAND: $cmd"
  $($cmd)
done

for cmd in "${host_commands[@]}"
do
  echo "COMMAND: $cmd"
  ssh root@host01 "$cmd"
done
