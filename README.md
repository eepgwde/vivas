# vivas
Live q charting from ticker-plant client to Javascript 

## Javascript Charting component

This is from elsewhere in Github. I have a fork with minor modifications for working with 
websockets directly (and not using socket.io with emit()).

It appears here as a submodule in the directory client/.

## q/kdb+ charting stream

These are contained in the directory kdb/. I've collated some utility pages from Kx Systems
and from websocket.org. I've reposted the c.js file from Kx Systems.

My contribution is the json0.q script. It has three sections. It checks the JSON
functions and loads some example JSON from the original MQTT server (application)
[https://github.com/NickJokic/mqtt-realtime-chart-server/blob/master/src/app.js].

It then sets up some example .z.ws functions. These are no longer tested directly in this script.

Finally, it uses .z.wo and .z.ts to pump data to the Javascript script chart.
