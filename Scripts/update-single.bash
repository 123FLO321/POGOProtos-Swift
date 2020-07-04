#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Removing old dir"
rm -rf $DIR/../Sources/POGOProtos
cd $DIR/../../POGOProtos
echo "Updating base repo"
git pull
echo "Generating .swift file"
protoc --swift_out=$DIR/../Sources --swift_opt=Visibility=Public base/base.proto
mv $DIR/../Sources/base $DIR/../Sources/POGOProtos
mv $DIR/../Sources/POGOProtos/base.pb.swift $DIR/../Sources/POGOProtos/POGOProtos.pb.swift
sed -i '' -e 's/POGOProtos_Rpc_//g' $DIR/../Sources/POGOProtos/POGOProtos.pb.swift

cd $DIR
echo "Starting Swift Build"
swift build
if [ $? -eq 0 ]; then
    echo Success!
else
    echo Failed!
fi
