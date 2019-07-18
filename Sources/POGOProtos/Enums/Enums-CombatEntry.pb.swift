// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: POGOProtos/Enums/CombatEntry.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

public enum POGOProtos_Enums_CombatEntry: SwiftProtobuf.Enum {
  public typealias RawValue = Int
  case npcCombat // = 0
  case receiveChallenge // = 1
  case sendChallenge // = 2
  case leagueSelection // = 3
  case invasionNpcCombat // = 4
  case UNRECOGNIZED(Int)

  public init() {
    self = .npcCombat
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .npcCombat
    case 1: self = .receiveChallenge
    case 2: self = .sendChallenge
    case 3: self = .leagueSelection
    case 4: self = .invasionNpcCombat
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .npcCombat: return 0
    case .receiveChallenge: return 1
    case .sendChallenge: return 2
    case .leagueSelection: return 3
    case .invasionNpcCombat: return 4
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension POGOProtos_Enums_CombatEntry: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [POGOProtos_Enums_CombatEntry] = [
    .npcCombat,
    .receiveChallenge,
    .sendChallenge,
    .leagueSelection,
    .invasionNpcCombat,
  ]
}

#endif  // swift(>=4.2)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension POGOProtos_Enums_CombatEntry: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "NPC_COMBAT"),
    1: .same(proto: "RECEIVE_CHALLENGE"),
    2: .same(proto: "SEND_CHALLENGE"),
    3: .same(proto: "LEAGUE_SELECTION"),
    4: .same(proto: "INVASION_NPC_COMBAT"),
  ]
}