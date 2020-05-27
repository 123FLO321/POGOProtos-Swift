#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
rm -rf $DIR/../Sources/POGOProtos
cd $DIR/../../POGOProtos/src/
git pull
FILES=$(find . -type f \( -iname "*.proto" \))
protoc --swift_out=$DIR/../Sources --swift_opt=Visibility=Public $FILES
cd $DIR/../Sources/POGOProtos

find . -name "*.swift" -print0 | while read -d $'\0' file
do
    filename=$(basename $file)
    fulldir=$(dirname $file)
    dirname=$(basename $fulldir)
    dirname2=$(basename $(dirname $fulldir))
    if [ "$dirname" == "." ]
    then
        dest="$fulldir/$filename"
    elif [ "$dirname2" == "." ]
    then
        dest="$fulldir/$dirname-$filename"
    else
        dest="$fulldir/$dirname2-$dirname-$filename"
    fi
    mv $file $dest
done

cd $DIR
swift build
if [ $? -eq 0 ]; then
    echo Success!
else
    echo Failed!
fi
