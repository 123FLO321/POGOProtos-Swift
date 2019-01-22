#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
rm -rf $DIR/../Sources/POGOProtos
cd $DIR/../../POGOProtos/src/
FILES=$(find . -type f \( -iname "*.proto" \))
protoc --swift_out=$DIR/../Sources --swift_opt=Visibility=Public $FILES
mv $DIR/../Sources/POGOProtos/Data/Player/PlayerBadge.pb.swift $DIR/../Sources/POGOProtos/Data/Player/PlayerPlayerBadge.pb.swift
mv $DIR/../Sources/POGOProtos/Data/Raid/ExclusiveTicketInfo.pb.swift $DIR/../Sources/POGOProtos/Data/Raid/RaidExclusiveTicketInfo.pb.swift
mv $DIR/../Sources/POGOProtos/Networking/Requests/Messages/GetFitnessReportMessage.pb.swift $DIR/../Sources/POGOProtos/Networking/Requests/Messages/MessagesGetFitnessReportMessage.pb.swift
mv $DIR/../Sources/POGOProtos/Networking/Requests/Messages/SetInGameCurrencyExchangeRateMessage.pb.swift $DIR/../Sources/POGOProtos/Networking/Requests/Messages/MessagesSetInGameCurrencyExchangeRateMessage.pb.swift
mv $DIR/../Sources/POGOProtos/Networking/Requests/Messages/GetInboxMessage.pb.swift $DIR/../Sources/POGOProtos/Networking/Requests/Messages/MessagesGetInboxMessage.pb.swift
mv $DIR/../Sources/POGOProtos/Networking/Requests/Messages/UpdateFitnessMetricsMessage.pb.swift $DIR/../Sources/POGOProtos/Networking/Requests/Messages/MessagesUpdateFitnessMetricsMessage.pb.swift
mv $DIR/../Sources/POGOProtos/Networking/Responses/GetFitnessReportResponse.pb.swift $DIR/../Sources/POGOProtos/Networking/Responses/ResponsesGetFitnessReportResponse.pb.swift
mv $DIR/../Sources/POGOProtos/Networking/Responses/GetAvailableSkusAndBalancesResponse.pb.swift $DIR/../Sources/POGOProtos/Networking/Responses/ResponsesGetAvailableSkusAndBalancesResponse.pb.swift
mv $DIR/../Sources/POGOProtos/Networking/Responses/PurchaseSkuResponse.pb.swift $DIR/../Sources/POGOProtos/Networking/Responses/ResponsesPurchaseSkuResponse.pb.swift
mv $DIR/../Sources/POGOProtos/Networking/Responses/RedeemGoogleReceiptResponse.pb.swift $DIR/../Sources/POGOProtos/Networking/Responses/ResponsesRedeemGoogleReceiptResponse.pb.swift
mv $DIR/../Sources/POGOProtos/Networking/Responses/SetInGameCurrencyExchangeRateResponse.pb.swift $DIR/../Sources/POGOProtos/Networking/Responses/ResponsesSetInGameCurrencyExchangeRateResponse.pb.swift
mv $DIR/../Sources/POGOProtos/Networking/Responses/UpdateFitnessMetricsResponse.pb.swift $DIR/../Sources/POGOProtos/Networking/Responses/ResponsesUpdateFitnessMetricsResponse.pb.swift
mv $DIR/../Sources/POGOProtos/Networking/Responses/Social/GetInboxResponse.pb.swift $DIR/../Sources/POGOProtos/Networking/Responses/Social/SocialGetInboxResponse.pb.swift
cd $DIR/../
swift build
echo Success!
