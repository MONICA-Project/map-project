FROM mono:latest

RUN mkdir /build
WORKDIR /build

COPY Librarys/litjson /build/Librarys/litjson
COPY Librarys/Mono.Posix /build/Librarys/Mono.Posix
COPY Librarys/mqtt /build/Librarys/mqtt
COPY Librarys/Coordinates /build/Librarys/Coordinates
COPY Lora-Map /build/Lora-Map
COPY Utils/Bot-Utils /build/Utils/Bot-Utils
COPY Utils/ConnectorDataMqtt /build/Utils/ConnectorDataMqtt
COPY Utils/Utils /build/Utils/Utils
COPY Utils/Utils-IoT /build/Utils/Utils-IoT

RUN mkdir Builds
RUN msbuild /p:Configuration="Release" /p:Platform="Any CPU" /p:OutputPath="./bin/Release/" "Lora-Map/Lora-Map.sln"

RUN sed -i s/"<div id=\"version\">vx.x.x"/"<div id=\"version\">$(grep -e "^\[assembly: AssemblyVersion(\"" Lora-Map/Lora-Map/Properties/AssemblyInfo.cs | cut -d'"' -f 2 | cut -d'.' -f 1).$(grep -e "^\[assembly: AssemblyVersion(\"" Lora-Map/Lora-Map/Properties/AssemblyInfo.cs | cut -d'"' -f 2 | cut -d'.' -f 2).$(grep -e "^\[assembly: AssemblyVersion(\"" Lora-Map/Lora-Map/Properties/AssemblyInfo.cs | cut -d'"' -f 2 | cut -d'.' -f 3)"/ Lora-Map/Lora-Map/bin/Release/resources/index.html

RUN mkdir /usr/local/bin/loramap -p
RUN cp Lora-Map/Lora-Map/bin/Release/*.dll /usr/local/bin/loramap -r
RUN cp Lora-Map/Lora-Map/bin/Release/*.exe /usr/local/bin/loramap -r
RUN cp Lora-Map/Lora-Map/bin/Release/resources /usr/local/bin/loramap -r

RUN mkdir /etc/loramap -p
RUN cp Lora-Map/Lora-Map/bin/Release/config-example/* /etc/loramap -r
RUN touch /etc/loramap/settings.conf
RUN touch /etc/loramap/requests.conf

WORKDIR /usr/local/bin/loramap
