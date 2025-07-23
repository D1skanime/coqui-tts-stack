# VoiceCraft-Docker

A repository with files to turn [VoiceCraft](https://github.com/AvionBlock/VoiceCraft) into an Docker Image.

The files are initially made by [Miniontoby](https://github.com/Miniontoby).
Miniontoby will try to keep this repo and the contents up-to-date.


## Usage

The images should be automatically be builded and pushed to the hub.docker.com and to the github packages.

You should be able to run with:
```bash
docker run -d -p 9050:9050 --name voicecraft_server sinevector241/voicecraft:latest
# OR
docker run -d -p 9050:9050 --name voicecraft_server ghcr.io/avionblock/voicecraft:latest
```

If you need to edit the config, then you can copy the config file to your local machine, edit it, and then upload it again:
```bash
# Download the file to local folder
docker cp voicecraft_server:config/ServerProperties.json .

# Edit the file using your editor (mine is nano)
nano ServerProperties.json

# Once you're done, upload it again and restart the server
docker cp ServerProperties.json voicecraft_server:config/ServerProperties.json
docker restart voicecraft_server
```


## Manually building the image

If you want to build the image yourself, follow these instructions.

Please note that there will come pre-builded images online soon...


### Requirements

In order to build
- `docker`
- `make` -> `apt-get -y install make`
- `git` -> `apt-get -y install git`


### Downloading these files

To download these file, I recommend using git:
```bash
git clone https://github.com/AvionBlock/VoiceCraft-Docker.git
cd VoiceCraft-Docker
```


### Building

To just build the image: 
```bash
make build
```

If you for some reason need to use the `host` network mode, run `make build_network` instead

After that, you can see it installed when running `docker images`

*P.s. the `make` command runs the needed `docker` commands for you, else you would be entering a long command, which you could mess up...*


### Usage

After builded the image, you can use it like any other docker image.

But I understand if people don't know/understand docker, so if you just want to start the server, run: 
```bash
make run
```

And again, if you for some reason need to use the `host` network mode, run `make run_network` instead


### Updating your Dockerfile

When this docker repo is updated (which probably will never happen...), follow these instructions to get your clone up-to-date.

When you downloaded using git, run these from within the `VoiceCraft-Docker` folder:
```bash
git pull
make build
```

And again, if you for some reason need to use the `host` network mode, run `make build_network` instead


### Updating the VoiceCraft version

I said "When this docker repo is updated", cause it always downloads the newest version of the VoiceCraft server.

So, if you want to update VoiceCraft server itself, then you just run the build command from the [Building section](#Building).
(It might not do anything new, since it probably just cached the result of the commands... idk what to do about that, yet...)


#### Reinstalling server

After updating the dockerimage, you should reinstall the server in order to let it use the newest version.

**It will completely remove the current server and then make a new one... so please be aware that your config will be lost!**

If you did use `make run` and you have updated the server now (__and if you left the config unchanged__), you can run this command to update your container:
```bash
make reinstall
```

And again, if you for some reason need to use the `host` network mode, run `make reinstall_network` instead



