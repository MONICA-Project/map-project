FROM mono:latest

RUN chmod oug+x update.sh
RUN update.sh

RUN mkdir Builds
RUN msbuild /p:Configuration="Release" /p:Platform="Any CPU" /p:OutputPath="./bin/Release/" "Lora-Map/Lora-Map.sln"

RUN cd Lora-Map/Lora-Map/dpkg
RUN chmod oug+x make-deb.sh

RUN ./make-deb.sh $(dpkg --print-architecture)

RUN cd ..
RUN cd ..
RUN cd ..

RUN dpkg -i Builds/*.deb
RUN rm Builds/*.deb

WORKDIR /usr/local/bin/loramap
