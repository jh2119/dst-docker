#!/bin/bash

# check for updates
./steamcmd.sh +runscript ./update_dst_ds.txt

# copy modoverrides.lua
dst_mods_setup="$HOME/.klei/DoNotStarveTogether/$CLUSTER/mods/dedicated_server_mods_setup.lua"
echo $dst_mods_setup
if [ -f $ds_mods_setup ]; then
    echo "copying mod setup"
    cp $dst_mods_setup "/home/dst/server/mods/"
fi

# copy modoverrides.lua
modoverrides="$HOME/.klei/DoNotStarveTogether/$CLUSTER/mods/modoverrides.lua"
echo $modoverrides
if [ -f $modoverrides ]; then
    echo "copying overrides"
    # TODO: for each server...
    cp $modoverrides "$HOME/.klei/DoNotStarveTogether/$CLUSTER/Master/"
    cp $modoverrides "$HOME/.klei/DoNotStarveTogether/$CLUSTER/Caves/"
fi

# load the server
cd ./server/bin
./dontstarve_dedicated_server_nullrenderer \
    -cluster $CLUSTER \
    -shard $SHARD
