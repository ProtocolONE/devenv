set ARG=
if "%1" == "-d" set ARG=%1%

docker-compose -f docker-compose.updater.yaml up %ARG%
