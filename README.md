# Lora-Map Project
Project that contains the Lora-Map and all its dependencies.

## Howto
Please checkout this project with it submodules and run Lora-Map/Lora-Map.sln to build a release. Then run Lora-Map/Lora-Map/dpkg/create-Builds.bat, it creates deb files that you can install with `sudo dpkg -i armhf-loramap_x.x-x.deb` or `sudo dpkg -i amd64-loramap_x.x-x.deb`

## Docker
If you want to use Docker for Build a local Version:
* Checkout or download this repo.
* Run `update.sh` to update all submodules from this repo.

### Dockercommands
* Build: `docker-compose build`
* Config: `mkdir ./config/json`, `mkdir ./config/maps`, `touch ./config/requests.conf` and `touch ./config/settings.conf`
  * Fill out the Configfiles, examples are in `Lora-Map/Lora-Map/config-example`
* Run: `docker-compose up`