set ARG=
if "%1" == "-d" set ARG=%1%

docker-compose -f docker-compose.latest.yaml pull && docker-compose -f docker-compose.latest.yaml up %ARG%
