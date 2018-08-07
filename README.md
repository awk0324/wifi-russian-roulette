# wifi russian roulette
![Nagant M1895 revolver](https://github.com/awk0324/wifi-russian-roulette/blob/master/Nagant_Revolver.jpg)


## what is this thing ##
This is a simple script which gets executed every time someone connects to a wifi network. It draws two random numbers between 1 and 6, an equivalent of the position of the round in the revolver's drum and the position of the drum itself. So metaphorically it loads a round in the revolver and spins the drum. When these two numbers differ, the scripts logs "lucky boi" and leaves the person to use the wifi. However, when these numbers are the same the script logs "Bang!" and kicks the user out of the network. And because nowadays phones reconnect like crazy, the script also keeps a neat little Death Note, so whenever someone who "got killed" previously shows up, it just logs "zombies cannot play" and kicks the user out again. Seems to work particularly nicely when the (re)connecting users are walking around the areas where wifi just barely reaches. The more reconnects, the more of a chance the Bang! comes along. 

Come to think of it, this could become a part of a nice BOFH toolkit for entertaining the bored admins and trolling innocent users...  &ast;evil laugh&ast;

## how to install it ##
Technically spoken all is done by a simple shell script triggered via hostapd_cli. It is meant to run on a single instance of hostapd (one SSID) and should run on any OpenWrt box. Well it should run pretty much on any linux box (famous last words). The following steps were tested on OpenWrt 17 and 18:
1) Install `hostapd_cli`. You'll likely need to remove the `wpad-mini`:
```
opkg remove wpad-mini
opkg install wpad hostapd-utils
```
2) Install `bash`. Not strictly needed, but essential to honor the BOFH aspect.
```
opkg install bash
```
## how to run it ##
Strictly seen you only need the roulette.sh file. The script will moan about the missing death.note first but will eventually create a new one. Your call. Once the file(s) are on the router, just run 
````
hostapd_cli -a ./roulette.sh
````
If you have an AP with multiple wlan interfaces and/or SSIDs, pass the correct interface via the -i switch, such as:
````
hostapd_cli -iwlan0-2 -a ./roulette.sh
````
Last but not least, if you want to keep a log (e.g. to cheer you up on a rainy day) simply redirect the output to a file:
````
hostapd_cli -iwlan0-2 -a ./roulette.sh 1 >> roulette.log 2>&1
````
----
ref: https://en.wikipedia.org/wiki/Russian_roulette
