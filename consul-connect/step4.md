# Enable Connections with `allow`

For the final step in this tutorial, let's enable communication between the `dashboard-service` and the `counting-service`.

Back at the [Consul Web UI](https://[[HOST_SUBDOMAIN]]-8500-[[KATACODA_HOST]].environments.katacoda.com/) in the Intentions menu, click the blue "Create" button to create an additional intention.

This intention will `allow` communication from the source `dashboard` service to the destination `counting` service. Find `dashboard` in the first pulldown, then find `counting` in the second pulldown. Select `allow` below. Optionally add a description.

Click "Save".

<img src="https://s3-us-west-1.amazonaws.com/education-yh/consul-connect/images/4-1-intention-allow.png" alt="Define an intention to allow communication" title="Define an intention to allow communication">

Finally, view the [Demo Dashboard](https://[[HOST_SUBDOMAIN]]-9002-[[KATACODA_HOST]].environments.katacoda.com/) which will automatically discover the new connection (no refresh is needed for this websockets-driven application). It should not take more than a few seconds. You will not need to restart any services since intentions which `allow` connectivity will take effect dynamically.

<img src="https://s3-us-west-1.amazonaws.com/education-yh/consul-connect/images/4-2-dashboard-connected.png" alt="Dashboard Connected to Counting Service" title="Dashboard Connected to Counting Service">
