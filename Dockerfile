FROM mcr.microsoft.com/dotnet/core/sdk:3.1

RUN mkdir /build
WORKDIR /build

COPY Lora-Map /build/Lora-Map

COPY Librarys/litjson /build/Librarys/litjson
COPY Librarys/mqtt /build/Librarys/mqtt
COPY Librarys/Coordinates /build/Librarys/Coordinates

COPY Utils/Bot-Utils /build/Utils/Bot-Utils
COPY Utils/ConnectorDataMqtt /build/Utils/ConnectorDataMqtt
COPY Utils/Utils /build/Utils/Utils
COPY Utils/Utils-IoT /build/Utils/Utils-IoT

WORKDIR /build/Lora-Map
RUN dotnet build Lora-Map.sln --configuration Release

RUN sed -i s/"<div id=\"version\">vx.x.x"/"<div id=\"version\">$(grep -e "<Version>" Lora-Map/Lora-Map.csproj | cut -d'>' -f 2 | cut -d'<' -f 1 | cut -d'.' -f 1).$(grep -e "<Version>" Lora-Map/Lora-Map.csproj | cut -d'>' -f 2 | cut -d'<' -f 1 | cut -d'.' -f 2).$(grep -e "<Version>" Lora-Map/Lora-Map.csproj | cut -d'>' -f 2 | cut -d'<' -f 1 | cut -d'.' -f 3)"/ Lora-Map/bin/Release/netcoreapp3.1/resources/index.html

RUN mkdir /usr/local/bin/loramap -p
RUN cp Lora-Map/bin/Release/netcoreapp3.1/*.dll /usr/local/bin/loramap -r
RUN cp Lora-Map/bin/Release/netcoreapp3.1/*.runtimeconfig.json /usr/local/bin/loramap -r
RUN cp Lora-Map/bin/Release/netcoreapp3.1/resources /usr/local/bin/loramap -r

WORKDIR /usr/local/bin/loramap
RUN rm -r /build

RUN mkdir /etc/loramap -p
