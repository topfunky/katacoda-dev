First, connect to `host01`. You'll examine the configuration for this service and then start the `counting-service` on port `9003`.

`ssh root@host01`{{execute}}

Consul is configured to look for the `counting-service` on port `9003`. You can see the configuration by looking at the configuration file at `/home/consul/config/counting.json`.

`cat /home/consul/config/counting.json`{{execute}}

NOTE: In most production environments, Consul configuration files are stored at `/etc/consul.d`.

Now start the service, specifying `PORT` as an environment variable.

`PORT=9003 counting-service`{{execute}}

You can view the output of the counting service at this URL. It's a simple JSON API.

https://[[HOST_SUBDOMAIN]]-9003-[[KATACODA_HOST]].environments.katacoda.com/
