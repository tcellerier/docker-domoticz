#!/bin/bash


#####################################################################################
### Synchronise les scripts LUA / Python et les plugins Pythons vers le container ###
###                       Le container doit être démarré !!                       ###
#####################################################################################


CONTAINER="domoticz-dev3.8153"

### LUA SCRIPTS ###
DIR_LUA_SCRIPTS="../21_Scripts_LUA/"

echo -e "\n## COPY LUA SCRIPTS ##"
for FILE in $(ls "${DIR_LUA_SCRIPTS}" | grep lua); do
    echo docker cp \"${DIR_LUA_SCRIPTS}${FILE}\" ${CONTAINER}:/home/pi/domoticz/scripts/lua/
    docker cp "${DIR_LUA_SCRIPTS}${FILE}" ${CONTAINER}:/home/pi/domoticz/scripts/lua/
done
echo docker exec --user root $CONTAINER chown -R pi /home/pi/domoticz/scripts/lua
docker exec --user root $CONTAINER chown -R pi /home/pi/domoticz/scripts/lua

### PYTHON SCRIPTS ###
DIR_PYTHON_SCRIPTS="../20_Scripts_Python/"

echo -e "\n## COPY PYTHON SCRIPTS ##"
for FILE in $(ls "${DIR_PYTHON_SCRIPTS}"); do
    echo docker cp \"${DIR_PYTHON_SCRIPTS}${FILE}\" ${CONTAINER}:/home/pi/domoticz/scripts/python/
    docker cp "${DIR_PYTHON_SCRIPTS}${FILE}" ${CONTAINER}:/home/pi/domoticz/scripts/python/
done
echo docker exec --user root $CONTAINER chown -R pi /home/pi/domoticz/scripts/python
docker exec --user root $CONTAINER chown -R pi /home/pi/domoticz/scripts/python


### PYTHON PLUGINS ###
DIR_PYTHON_PLUGINS="../22_Plugins_Python/"

echo -e "\n## COPY PYTHON PLUGINS ##"
for FILE in $(ls "${DIR_PYTHON_PLUGINS}"); do
    echo docker cp \"${DIR_PYTHON_PLUGINS}${FILE}\" ${CONTAINER}:/home/pi/domoticz/plugins/
    docker cp "${DIR_PYTHON_PLUGINS}${FILE}" ${CONTAINER}:/home/pi/domoticz/plugins/
done
echo docker exec --user root $CONTAINER chown -R pi /home/pi/domoticz/plugins
docker exec --user root $CONTAINER chown -R pi /home/pi/domoticz/plugins
