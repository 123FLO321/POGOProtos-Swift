#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
echo "Removing old dir"
rm -rf $DIR/../Sources/POGOProtos
mkdir $DIR/../Sources/POGOProtos/
cd $DIR/../../POGOProtos
#echo "Updating base repo"
#git pull
export PATH=$PATH:/Users/georgespereira/protoc-3/bin
python compile_base.py -l swift
mv out/single_file/swift/POGOProtos.Rpc.pb.swift $DIR/../Sources/POGOProtos/POGOProtos.pb.swift
#if need *.desc need one other folder as POGOProtos swift build bugs or need ignore compile it in package conf.
#note all data in desc file refer to POGOProtos.Rpc but this need here cleaned for good package.
#mv out/single_file/swift/POGOProtos.Rpc.desc $DIR/../Sources/POGOProtos/POGOProtos.desc
sed -i '' -e 's/POGOProtos_Rpc_//g' $DIR/../Sources/POGOProtos/POGOProtos.pb.swift

##clean up tiers repo..
# Set the filename generated
filename=$DIR/../../POGOProtos/base/POGOProtos.Rpc.proto
# Create an empty file
touch $filename
# Check the file is exists or not
if [ -f $filename ]; then
  rm $filename
fi
##

#back to home
cd $DIR
echo "Starting Swift Build"
swift build
if [ $? -eq 0 ]; then
  echo Success!
else
  echo Failed!
fi
