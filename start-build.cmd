set ARG=
if "%1" == "-d" set ARG=%1%

docker-compose -f docker-compose.build.yaml up --build %ARG% 
