
host_commands=(
"mkdir -p ~/.bin"
"mkdir -p ~/src"
"mkdir -p ~/tutorial/config"
"cd ~/src && curl -L http://assets.joinscrapbook.com/unzip -O"
"mv ~/src/unzip ~/.bin/unzip"
"chmod +x ~/.bin/unzip"

"cd ~/src && curl -L https://releases.hashicorp.com/consul/1.2.2/consul_1.2.2_linux_amd64.zip -O"
"unzip -d ~/.bin ~/src/consul*.zip"

"mkdir -p ~/log"
"nohup sh -c \"consul agent -dev -config-dir=~/config >~/log/consul.log 2>&1 &\" &"
)

function join { local IFS="$1"; shift; echo "$*"; }

for cmd in "${host_commands[@]}"
do
  echo "COMMAND: ${cmd}"
  $(${cmd})
done

all_commands=$(join " && " ${host_commands[@]})
ssh root@host01 "${all_commands}"
