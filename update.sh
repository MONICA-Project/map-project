#!/bin/bash
echo "Pull Librarys/litjson"
if [ -a Librarys/litjson/.git ] 
then
	cd Librarys/litjson
	git pull
	cd ..
	cd ..
else
	git submodule update --init --  Librarys/litjson
	cd Librarys/litjson
	git checkout master
	cd ..
	cd ..
fi

echo "Pull Librarys/Mono.Posix"
if [ -a Librarys/Mono.Posix/.git ] 
then
	cd Librarys/Mono.Posix
	git pull
	cd ..
	cd ..
else
	git submodule update --init --  Librarys/Mono.Posix
	cd Librarys/Mono.Posix
	git checkout master
	cd ..
	cd ..
fi

echo "Pull Librarys/mqtt"
if [ -a Librarys/mqtt/.git ] 
then
	cd Librarys/mqtt
	git pull
	cd ..
	cd ..
else
	git submodule update --init --  Librarys/mqtt
	cd Librarys/mqtt
	git checkout master
	cd ..
	cd ..
fi

echo "Pull Lora-Map"
if [ -a Lora-Map/.git ] 
then
	cd Lora-Map
	git pull
	cd ..
else
	git submodule update --init --  Lora-Map
	cd Lora-Map
	git checkout master
	cd ..
fi

echo "Pull Utils/Bot-Utils"
if [ -a Utils/Bot-Utils/.git ] 
then
	cd Utils/Bot-Utils
	git pull
	cd ..
	cd ..
else
	git submodule update --init --  Utils/Bot-Utils
	cd Utils/Bot-Utils
	git checkout master
	cd ..
	cd ..
fi

echo "Pull Utils/ConnectorDataMqtt"
if [ -a Utils/ConnectorDataMqtt/.git ] 
then
	cd Utils/ConnectorDataMqtt
	git pull
	cd ..
	cd ..
else
	git submodule update --init --  Utils/ConnectorDataMqtt
	cd Utils/ConnectorDataMqtt
	git checkout master
	cd ..
	cd ..
fi

echo "Pull Utils/Utils"
if [ -a Utils/Utils/.git ] 
then
	cd Utils/Utils
	git pull
	cd ..
	cd ..
else
	git submodule update --init --  Utils/Utils
	cd Utils/Utils
	git checkout master
	cd ..
	cd ..
fi

echo "Pull Utils/Utils-IoT"
if [ -a Utils/Utils-IoT/.git ] 
then
	cd Utils/Utils-IoT
	git pull
	cd ..
	cd ..
else
	git submodule update --init --  Utils/Utils-IoT
	cd Utils/Utils-IoT
	git checkout master
	cd ..
	cd ..
fi

if [ -z "$1" ]
then
	read -p "Please Press key"
fi