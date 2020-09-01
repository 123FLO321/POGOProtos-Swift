// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: POGOProtos/Data/Player/TimedGroupChallengePlayerStats.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

public struct POGOProtos_Data_Player_TimedGroupChallengePlayerStats {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var challenges: [POGOProtos_Data_Player_TimedGroupChallengePlayerStats.IndividualChallengeStats] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public struct IndividualChallengeStats {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    public var challengeID: String = String()

    public var playerScore: Int32 = 0

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "POGOProtos.Data.Player"

extension POGOProtos_Data_Player_TimedGroupChallengePlayerStats: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".TimedGroupChallengePlayerStats"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "challenges"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.challenges)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.challenges.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.challenges, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: POGOProtos_Data_Player_TimedGroupChallengePlayerStats, rhs: POGOProtos_Data_Player_TimedGroupChallengePlayerStats) -> Bool {
    if lhs.challenges != rhs.challenges {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension POGOProtos_Data_Player_TimedGroupChallengePlayerStats.IndividualChallengeStats: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = POGOProtos_Data_Player_TimedGroupChallengePlayerStats.protoMessageName + ".IndividualChallengeStats"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "challenge_id"),
    2: .standard(proto: "player_score"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.challengeID)
      case 2: try decoder.decodeSingularInt32Field(value: &self.playerScore)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.challengeID.isEmpty {
      try visitor.visitSingularStringField(value: self.challengeID, fieldNumber: 1)
    }
    if self.playerScore != 0 {
      try visitor.visitSingularInt32Field(value: self.playerScore, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: POGOProtos_Data_Player_TimedGroupChallengePlayerStats.IndividualChallengeStats, rhs: POGOProtos_Data_Player_TimedGroupChallengePlayerStats.IndividualChallengeStats) -> Bool {
    if lhs.challengeID != rhs.challengeID {return false}
    if lhs.playerScore != rhs.playerScore {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}