set ARG=""
if %1 == "-d" then
  set ARG=%1%
echo %ARG%

docker-compose -f docker-compose.build.yaml up --build %ARG% 
