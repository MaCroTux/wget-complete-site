ARGUMENTS=$@

if [[ -z "${ARGUMENTS}" ]]; then
   echo "Please enter url to download from arguments."
   exit
fi

NUMBER_DOCKER_IMAGE=`docker images wget-full-pages | wc -l`

if [ ${NUMBER_DOCKER_IMAGE} -lt "2" ];
then
docker build -t "wget-full-pages" ./bundle/
fi

docker run                                                                     \
  --rm                                                                         \
  -it                                                                          \
  -v ${PWD}/download:/data/download                                            \
  wget-full-pages                                                              \
  "/data/download.sh ${ARGUMENTS}"
