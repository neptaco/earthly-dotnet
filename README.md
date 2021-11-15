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
 $ docker run --rm -p 127.0.0.1:8080:80 neptaco/eathly-examples:dotnet
```

Open http://localhost:8080/WeatherForecast

