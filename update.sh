git submodule update --init --  Librarys/litjson
git submodule update --init --  Librarys/Mono.Posix
git submodule update --init --  Librarys/mqtt
git submodule update --init --  Utils/Bot-Utils
git submodule update --init --  Utils/ConnectorDataMqtt
git submodule update --init --  Utils/Utils
git submodule update --init --  Utils/Utils-IoT
echo "Switch to subdir Librarys"
cd Librarys
echo "Pull litjson"
cd litjson
git pull origin master
cd ..
echo "Pull Mono.Posix"
cd Mono.Posix
git pull origin master
cd ..
echo "Pull mqtt"
cd mqtt
git pull origin master
cd ..
cd ..
echo "Pull Lora-Map"
cd Lora-Map
git pull origin master
cd ..
echo "Switch to subdir Utils"
cd Utils
echo "Pull Bot-Utils"
cd Bot-Utils
git pull origin master
cd ..
echo "Pull ConnectorDataMqtt"
cd ConnectorDataMqtt
git pull origin master
cd ..
echo "Pull Utils"
cd Utils
git pull origin master
cd ..
echo "Pull Utils-IoT"
cd Utils-IoT
git pull origin master
cd ..
read -p "Press return"