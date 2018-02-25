# Running a Dedicated Don't Starve Together Server in Docker
This is an attempt create a docker setup for a dedicated server running Don't Starve Together, so other players are not stopped when I leave the game. 


## Things to Note
First, this is a big work in progress. It does not work at this point.

Second, ```docker``` may not be a great system, but I have high hopes.

Third, run these commands... (this is mostly for my memory):
``` bash
# building the dockerfile for testing
docker build .
docker run -t -i <container_id>

# running with docker-compse (this allows for persistant volumes)
# I think this will be how to update the server files
docker-compose up -d

# access the container to look around
docker exec -ti DST_DST_01 /bin/bash


# other helpful things
docker ps
docker volumes ls

```
 

## References
Initial guide: http://steamcommunity.com/sharedfiles/filedetails/?id=590565473

Using ```steamcmd```: https://developer.valvesoftware.com/wiki/Command_Line_Options#SteamCMD

More about ```steamcmd```: https://developer.valvesoftware.com/wiki/SteamCMD
