# Monica Lora-Map Project
<!-- Short description of the project. -->

Project that contains the Lora-Map and all its dependencies. This readme is meant for describing the application with all dependencies, see `Deployment` if you want to work with.

<!-- A teaser figure may be added here. It is best to keep the figure small (<500KB) and in the same repo -->
![Preview](https://raw.githubusercontent.com/MONICA-Project/lora-map/v1.2.10/Lora-Map.jpg)

## Getting Started
<!-- Instruction to make the project up and running. -->

The project documentation is available on the [Wiki](https://github.com/MONICA-Project/lora-map/wiki) of lora-map.

## Deployment
<!-- Deployment/Installation instructions. If this is software library, change this section to "Usage" and give usage examples -->

### Checkout
Please checkout this project with it submodules:
```bash
git clone https://github.com/MONICA-Project/map-project
bash update.sh 
```

### Docker
To run the latest version of Lora-Map, [Checkout this repo](#Checkout) and then run:
```bash
docker-compose build
mkdir ./config/config -p
mkdir ./config/maps
mkdir ./config/json
touch ./config/config/requests.conf
cp ./Lora-Map/Lora-Map/config-example/settings.conf.example ./config/config/settings.conf
docker-compose up
```
Edit the `settings.conf` maybe.

## Development
<!-- Developer instructions. -->

### Build

This depends on the OS you running.

#### Windows

[Checkout this repo](#Checkout) and open `ora-Map/Lora-Map.sln` in Visual Studio. Then run Debug or Release.

On Windows you can create with `Lora-Map/Lora-Map/dpkg/create-Builds.bat` deb files for Linux, if you have WSL installed

#### Linux

[Checkout this repo](#Checkout) and run: `dotnet build Lora-Map.sln --configuration Release`

You must have `dotnet-sdk-3.0` installed

If you want to have deb files run `cd Lora-Map/Lora-Map/dpkg` and `bash make-deb.sh armhf` that you can install with `sudo dpkg -i armhf-loramap_x.x-x.deb`

### Prerequisite

You need C# .NET Core 3, installation instructions are available [here](https://docs.microsoft.com/en-us/dotnet/core/install/linux-package-manager-debian10). You need only setup apt.

If you install the deb packets, it will check and install all dependencies.

## Contributing
Contributions are welcome. 

Please fork, make your changes, and submit a pull request. For major changes, please open an issue first and discuss it with the other authors.

## Affiliation
![MONICA](https://github.com/MONICA-Project/template/raw/master/monica.png)  
This work is supported by the European Commission through the [MONICA H2020 PROJECT](https://www.monica-project.eu) under grant agreement No 732350.