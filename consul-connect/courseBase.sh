
host_commands = (
"apt-get install -y unzip"

"curl -L -o ~/.bin/consul.zip https://releases.hashicorp.com/consul/1.2.2/consul_1.2.2_linux_amd64.zip"
"unzip -d ~/.bin ~/.bin/consul.zip"
"rm ~/.bin/consul.zip"

"mkdir -p ~/log"
"nohup sh -c \"consul agent -dev -config-dir=~/config >~/log/consul.log 2>&1 &\" &"
)

for cmd in "${host_commands[@]}"
do
  ssh root@host01 "${cmd}"
done

ssh root@host02 'echo "HELLO"'
