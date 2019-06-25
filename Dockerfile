FROM mono:latest

RUN mkdir /build
WORKDIR /build

RUN apt-get update && apt-get install git -y

RUN git clone https://gitlab.fit.fraunhofer.de/monica/lora-map/map-project.git
WORKDIR map-project

RUN chmod oug+x update.sh
RUN ./update.sh nowait
RUN ls Lora-Map

RUN mkdir Builds
RUN msbuild /p:Configuration="Release" /p:Platform="Any CPU" /p:OutputPath="./bin/Release/" "Lora-Map/Lora-Map.sln"

WORKDIR Lora-Map/Lora-Map/dpkg
RUN chmod oug+x make-deb.sh
RUN ./make-deb.sh $(dpkg --print-architecture)

WORKDIR /build/map-project/Builds
RUN dpkg -i *.deb
RUN rm *.deb

WORKDIR /usr/local/bin/loramap
