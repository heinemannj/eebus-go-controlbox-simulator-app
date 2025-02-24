# Server Ports

|app name|app port|frontend port|eebus-port|comment|
|:---:|:---:|:---:|:---:|:---:|
|controlbox||7050|4713|Example code for sending LPC and LPP limits to a EMS|
|devices|7050|7051|4815|For connection to EEBUS devices and fetch their supported features|
|hems|||4714|Example code for accepting LPC and LPP limits from a control box, receiving and printing data to the console from battery (VABD) and pv inverters (VAPD) and grid connection point data (MGCP)|
|evse|||4715|Example code for accepting LPC from a control box|
|evcc||7070||An extensible EV Charge Controller and home energy management system|

evcc:
9522,7090,8887,5353
