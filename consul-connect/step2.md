Next, connect to `host01` in a new terminal. You'll start the front-end `dashboard-service` on port `9002`.

Click the **+** button in the tab bar and select **Open New Terminal**.

Now connect to `host01` again.

`ssh root@host01`{{execute}}

Consul is configured to look for the `dashboard-service` on port `9002`. You can see the configuration by looking at the configuration file at `/home/consul/config/dashboard.json`.

`cat /home/consul/config/dashboard.json`{{execute}}

Now start the service, specifying `PORT` as an environment variable.

`PORT=9002 dashboard-service`{{execute}}

You can view this dashboard at this URL:

https://[[HOST_SUBDOMAIN]]-9002-[[KATACODA_HOST]].environments.katacoda.com/

The front-end dashboard is reading the backend counting service and displays the number. Consul Connect is being used to proxy communication between the two services.
