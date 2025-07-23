# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/dotnet/runtime:8.0-alpine
LABEL description="Docker image version of VoiceCraft"
LABEL maintainer="Miniontoby"
LABEL org.opencontainers.image.source=https://github.com/AvionBlock/VoiceCraft-Docker
LABEL org.opencontainers.image.description="Docker image version of VoiceCraftt"
LABEL org.opencontainers.image.licenses=MIT
LABEL org.opencontainers.image.authors="Miniontoby"

RUN apk add --no-cache --update curl unzip

WORKDIR /app
RUN curl -Lo VoiceCraft.Server.zip https://github.com/AvionBlock/VoiceCraft/releases/latest/download/VoiceCraft.Server.zip
RUN unzip VoiceCraft.Server.zip
RUN rm VoiceCraft.Server.zip

EXPOSE 9050/tcp
EXPOSE 9050/udp
CMD ["dotnet", "VoiceCraft.Server.dll"]

