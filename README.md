# ASP.NET Core build sample with [EARTHLY](https://earthly.dev/)


## Pre-requisites

- EARTHLY
    - [Get Earthly](https://earthly.dev/get-earthly/)
    - [Getting Started](https://docs.earthly.dev/basics)

## Docker Build

```bash
$ earthly +docker
```

## Run

```bash
 $ docker run -it --rm -p 8080:80 eathly-dotnet
```

Open http://localhost:8080/WeatherForecast

## Docker

```bash
$ docker build -t docker-dotnet .
$ docker run -it --rm -p 8080:80 docker-dotnet
```
