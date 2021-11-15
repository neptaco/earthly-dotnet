FROM mcr.microsoft.com/dotnet/sdk:6.0
WORKDIR /dotnet-example

deps:
    # copying project files and restoring NuGet packages allows docker to cache the layer and only re-build it when NuGet packages change
    COPY WebApiSample/WebApiSample.csproj src/
    RUN dotnet restore src/

build:
    FROM +deps
    COPY WebApiSample src

    # make sure you have /bin and /obj in .earthignore, as their content from context might cause problems
    RUN dotnet publish --no-restore src -o publish

    #SAVE ARTIFACT publish AS LOCAL publish
    SAVE ARTIFACT publish

docker:
    FROM mcr.microsoft.com/dotnet/aspnet:6.0
    WORKDIR /publish
    COPY +build/publish ./
    ENTRYPOINT ["dotnet", "WebApiSample.dll"]
    SAVE IMAGE neptaco/eathly-examples:dotnet