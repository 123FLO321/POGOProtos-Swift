#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

# Deps for build all this.
echo "Update and uses last or specific version of protoc."
PROTO="21.12"
# Tag of generator this is same of Package.swift.
GEN_TAG="1.19.0"
# Dir of put deps.
PROTOC_DIR=~/protoc-3
mkdir -p $PROTOC_DIR
pushd $PROTOC_DIR
rm -rf *.zip
echo "Download protoc version: $PROTO"
curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v$PROTO/protoc-$PROTO-osx-x86_64.zip
unzip -o ./protoc-$PROTO-osx-x86_64
chmod +x ./bin/protoc
# Update protoc-gen-swift
echo "Updating swift-protobuf repo for tag: $GEN_TAG"
rm -rf ./swift-protobuf
git clone https://github.com/apple/swift-protobuf.git ./swift-protobuf
cd ./swift-protobuf
git checkout tags/$GEN_TAG -b $GEN_TAG
echo "Build protoc-gen-swift version: $GEN_TAG"
swift build -c release
cd ..
cp -f ./swift-protobuf/.build/x86_64-apple-macosx/release/protoc-gen-swift ./bin/protoc-gen-swift
chmod +x ./bin/protoc-gen-swift
PATH="$PROTOC_DIR/bin:${PATH}"
export PATH
popd

echo "Removing old dir"
rm -rf $DIR/../Sources/POGOProtos
mkdir $DIR/../Sources/POGOProtos/
# Dir of cloned POGOProtos
PROTO_CLONE=$DIR/../../POGOProtos
cd $PROTO_CLONE

# Private mode 'git pull' bad get err...
#echo "Updating base repo"
#git pull

# Compile protos swift
python3 ./compile_base.py -l swift
mv ./out/single_file/swift/POGOProtos.Rpc.pb.swift $DIR/../Sources/POGOProtos/POGOProtos.pb.swift
#if need *.desc need one other folder as POGOProtos swift build bugs or need ignore compile it in package conf.
#note all data in desc file refer to POGOProtos.Rpc but this need here cleaned for good package.
#mv ./out/single_file/swift/POGOProtos.Rpc.desc $DIR/../Sources/POGOProtos/POGOProtos.desc
sed -i '' -e 's/POGOProtos_Rpc_//g' $DIR/../Sources/POGOProtos/POGOProtos.pb.swift

# Clean up tiers repo..
# Set the filename generated
filename=$PROTO_CLONE/base/POGOProtos.Rpc.proto
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
