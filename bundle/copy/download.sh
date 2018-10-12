DOWNLOAD_DIR="download"
DOWNLOAD_URL=$1
HOST_NAME=`echo ${DOWNLOAD_URL} | sed -e 's|^[^/]*//||' -e 's|/.*$||'`

if [ ! -d $DOWNLOAD_DIR ];
then
mkdir $DOWNLOAD_DIR
fi

wget -S 																														           \
  --no-check-certificate 																										   \
  --recursive 																															   \
  --page-requisites 																												   \
  --convert-links   																												   \
  --domains ${HOST_NAME}  																									   \
  -P /data/${DOWNLOAD_DIR} 																									   \
  ${DOWNLOAD_URL}                                                           && \
zip -r                                                                         \
  /data/${DOWNLOAD_DIR}/${HOST_NAME}.zip                                       \
  /data/${DOWNLOAD_DIR}/${HOST_NAME}                                        && \
rm -r $DOWNLOAD_DIR/$HOST_NAME
