# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /build

# copy csproj and restore as distinct layers
COPY WebApiSample/*.csproj .
RUN pwd && ls -la
RUN dotnet restore

# copy everything else and build app
COPY WebApiSample .
RUN dotnet publish -c release --no-restore -o /publish

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /publish ./
ENTRYPOINT ["dotnet", "WebApiSample.dll"]