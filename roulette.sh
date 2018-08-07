#!/bin/bash
if [[ $2 == "AP-STA-CONNECTED" ]]
then
		date
  	echo "new player with mac id $3"

		DEAD_ALREADY=$(grep $3 ./death.note)

		if [ -n "$DEAD_ALREADY" ]
		then
			echo '   zombies cannot play'
			hostapd_cli -iwlan0 disassociate $3 > /dev/null
		else
		CHAMBER=$(echo $((( RANDOM % 6 ) + 1 )))
		REVOLVER=$(echo $((( RANDOM % 6 ) + 1 )))
			if [ $CHAMBER == $REVOLVER ]
				then
						echo "BANG! You died."
						echo
						hostapd_cli -iwlan0 disassociate $3 > /dev/null
						echo $3 >> ./death.note
				else
						echo  "Lucky boi :P"
						echo
			fi
		fi
fi
