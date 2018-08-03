
host_commands=(
"apt-get install -y unzip"

"curl -L -o ~/.bin/consul.zip https://releases.hashicorp.com/consul/1.2.2/consul_1.2.2_linux_amd64.zip"
"unzip -d ~/.bin ~/.bin/consul.zip"
"rm ~/.bin/consul.zip"

"mkdir -p ~/log"
"nohup sh -c \"consul agent -dev -config-dir=~/config >~/log/consul.log 2>&1 &\" &"
)

function join { local IFS="$1"; shift; echo "$*"; }

for cmd in "${host_commands[@]}"
do
  echo "${cmd}"
  $(${cmd})
done

all_commands=$(join " && " ${host_commands[@]})
ssh root@host01 "${all_commands}"
