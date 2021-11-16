FROM mcr.microsoft.com/dotnet/sdk:6.0
WORKDIR /build

deps:
    # copying project files and restoring NuGet packages allows docker to cache the layer and only re-build it when NuGet packages change
    COPY WebApiSample/*.csproj .
    RUN dotnet restore

build:
    FROM +deps
    COPY WebApiSample .

    # make sure you have /bin and /obj in .earthignore, as their content from context might cause problems
    RUN dotnet publish -c release --no-restore -o publish

    #SAVE ARTIFACT publish AS LOCAL publish
    SAVE ARTIFACT publish

docker:
    FROM mcr.microsoft.com/dotnet/aspnet:6.0
    WORKDIR /app
    COPY +build/publish ./
    ENTRYPOINT ["dotnet", "WebApiSample.dll"]
    SAVE IMAGE eathly-dotnet