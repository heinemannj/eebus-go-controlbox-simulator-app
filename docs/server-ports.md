# Server Ports

|service name|app port|frontend port|eebus-port|local ski|remote ski|comment|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|eebus-go-controlbox_evcc|7070|7711|4711|99a4d0cad4654d2ef8fb0dff7b8ea0c6501bc6c5|30787eb7247d335e13bca8eb1bdb828589ef0b24|Example code for sending LPC and LPP limits to evcc|
|eebus-go-controlbox_eebus-go-hems|7812|7712|4712|99a4d0cad4654d2ef8fb0dff7b8ea0c6501bc6c5|4ddb0acd51bf3e544f6cf4cb092e065d9648f8ca|Example code for sending LPC and LPP limits to eebus-go-hems|
|eebus-go-hems|||4721|4ddb0acd51bf3e544f6cf4cb092e065d9648f8ca|99a4d0cad4654d2ef8fb0dff7b8ea0c6501bc6c5|Example code for accepting LPC and LPP limits from a control box, receiving and printing data to the console from battery (VABD) and pv inverters (VAPD) and grid connection point data (MGCP)|
|eebus-go-evse|||4731|||Example code for accepting LPC from a control box|
|eebus-go-devices|7050|7051|4741|||For connection to EEBUS devices and fetch their supported features|
|evcc||7070||30787eb7247d335e13bca8eb1bdb828589ef0b24|99a4d0cad4654d2ef8fb0dff7b8ea0c6501bc6c5|An extensible EV Charge Controller and home energy management system|

evcc:
9522,7090,8887,5353
