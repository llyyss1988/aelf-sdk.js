#!/bin/bash

HERE=$(cd "$(dirname "$0")";pwd)
echo '${HERE}---------'
echo ${HERE}
cd ${HERE}
echo "ls"
ls 
TAG=$1
NUGET_API_KEY=$2

echo "$TAG ,,,,,,"

# TODO: verify version
VERSION=`echo $TAG | cut -b 2-`
echo "$VERSION"
echo "ls"
ls 
NUPKG="${HERE}/AElf.JSDK.${VERSION}.nupkg"
echo "$NUPKG"
# build
mkdir AElf.JSDK/content
cp -r ../dist/* AElf.JSDK/content/
dotnet build AElf.JSDK/AElf.JSDK.csproj --configuration Release -P:Version=${VERSION} -o ../


echo "ls"
ls 
if [ ! -f "${NUPKG}" ]; then
    echo "package not exist: ${NUPKG}"
    exit 1
fi
echo "ls"
# publish
#dotnet nuget push ${NUPKG} -k ${NUGET_API_KEY} -s https://api.nuget.org/v3/index.json
