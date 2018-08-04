First, connect to `host01`. You'll examine the configuration for this service and then start the `counting-service` on port `9003`.

`ssh root@host01`{{execute}}

Consul is configured to look for the `counting-service` on port `9003`. You can see the configuration by looking at the configuration file at `/etc/consul.d/counting.json`.

`cat /etc/consul.d/counting.json`{{execute}}

There are three important settings here.

* Consul will look for a service running on port 9003. It will advertise that as the `counting` service. On a properly configured node, this can be reached as `counting.service.consul` through DNS.
* A blank proxy is defined. This enables proxy communication through Consul Connect but doesn't define any connections right away.
* A health check examines the local `/health` endpoint every second to determine whether the service is healthy and can be exposed to other services.

Now, start the service, specifying `PORT` as an environment variable.

`PORT=9003 counting-service`{{execute}}

You can view the output of the counting service at this URL. It's a simple JSON API.

https://[[HOST_SUBDOMAIN]]-9003-[[KATACODA_HOST]].environments.katacoda.com/
