# wifi russian roulette

This is a simple script running via hostapd_cli. It is meant to run on a single instance of hostapd (one SSID) and it gets triggered whenever someone connects to the corresponding wireless network. The cript draws two random number between 1 and 6, an equivalent of the position of the round in the revolver's drum and the position of the drum itself. So metaphorically it loads a round in the revolver and spins the drum. When these two numbers differ, the scripts logs "lucky boi" and leaves the person to use the wifi. However, when the numbers are the same the script logs "Bang!" and kicks the user out of network. And because nowadays phones reconnect like crazy, the script also keeps a neat little Death Note, so whenever someone who "got killed" previously, shows up, it just logs "zombies cannot play" and kicks the user out again.

Seemss to work particularly nicely when the (re)connecting users are walking around the areas where wifi just barely reaches. The more reconnects, the more of a chance the Bang! comes along. 

Come to think of it, this could become a part of a nice BOFH toolkit for entertaining the bored admins and trolling innocent users
&ast;evil laugh&ast;
