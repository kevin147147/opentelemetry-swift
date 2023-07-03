// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: opentelemetry/proto/trace/v1/trace.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Copyright 2019, OpenTelemetry Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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

/// TracesData represents the traces data that can be stored in a persistent storage,
/// OR can be embedded by other protocols that transfer OTLP traces data but do
/// not implement the OTLP protocol.
///
/// The main difference between this message and collector protocol is that
/// in this message there will not be any "control" or "metadata" specific to
/// OTLP protocol.
///
/// When new fields are added into this message, the OTLP request MUST be updated
/// as well.
struct Opentelemetry_Proto_Trace_V1_TracesData {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// An array of ResourceSpans.
  /// For data coming from a single resource this array will typically contain
  /// one element. Intermediary nodes that receive data from multiple origins
  /// typically batch the data before forwarding further and in that case this
  /// array will contain multiple elements.
  var resourceSpans: [Opentelemetry_Proto_Trace_V1_ResourceSpans] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// A collection of ScopeSpans from a Resource.
struct Opentelemetry_Proto_Trace_V1_ResourceSpans {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The resource for the spans in this message.
  /// If this field is not set then no resource info is known.
  var resource: Opentelemetry_Proto_Resource_V1_Resource {
    get {return _resource ?? Opentelemetry_Proto_Resource_V1_Resource()}
    set {_resource = newValue}
  }
  /// Returns true if `resource` has been explicitly set.
  var hasResource: Bool {return self._resource != nil}
  /// Clears the value of `resource`. Subsequent reads from it will return its default value.
  mutating func clearResource() {self._resource = nil}

  /// A list of ScopeSpans that originate from a resource.
  var scopeSpans: [Opentelemetry_Proto_Trace_V1_ScopeSpans] = []

  /// This schema_url applies to the data in the "resource" field. It does not apply
  /// to the data in the "scope_spans" field which have their own schema_url field.
  var schemaURL: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _resource: Opentelemetry_Proto_Resource_V1_Resource? = nil
}

/// A collection of Spans produced by an InstrumentationScope.
struct Opentelemetry_Proto_Trace_V1_ScopeSpans {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The instrumentation scope information for the spans in this message.
  /// Semantically when InstrumentationScope isn't set, it is equivalent with
  /// an empty instrumentation scope name (unknown).
  var scope: Opentelemetry_Proto_Common_V1_InstrumentationScope {
    get {return _scope ?? Opentelemetry_Proto_Common_V1_InstrumentationScope()}
    set {_scope = newValue}
  }
  /// Returns true if `scope` has been explicitly set.
  var hasScope: Bool {return self._scope != nil}
  /// Clears the value of `scope`. Subsequent reads from it will return its default value.
  mutating func clearScope() {self._scope = nil}

  /// A list of Spans that originate from an instrumentation scope.
  var spans: [Opentelemetry_Proto_Trace_V1_Span] = []

  /// This schema_url applies to all spans and span events in the "spans" field.
  var schemaURL: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _scope: Opentelemetry_Proto_Common_V1_InstrumentationScope? = nil
}

/// A Span represents a single operation performed by a single component of the system.
///
/// The next available field id is 17.
struct Opentelemetry_Proto_Trace_V1_Span {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// A unique identifier for a trace. All spans from the same trace share
  /// the same `trace_id`. The ID is a 16-byte array. An ID with all zeroes OR
  /// of length other than 16 bytes is considered invalid (empty string in OTLP/JSON
  /// is zero-length and thus is also invalid).
  ///
  /// This field is required.
  var traceID: Data = Data()

  /// A unique identifier for a span within a trace, assigned when the span
  /// is created. The ID is an 8-byte array. An ID with all zeroes OR of length
  /// other than 8 bytes is considered invalid (empty string in OTLP/JSON
  /// is zero-length and thus is also invalid).
  ///
  /// This field is required.
  var spanID: Data = Data()

  /// trace_state conveys information about request position in multiple distributed tracing graphs.
  /// It is a trace_state in w3c-trace-context format: https://www.w3.org/TR/trace-context/#tracestate-header
  /// See also https://github.com/w3c/distributed-tracing for more details about this field.
  var traceState: String = String()

  /// The `span_id` of this span's parent span. If this is a root span, then this
  /// field must be empty. The ID is an 8-byte array.
  var parentSpanID: Data = Data()

  /// A description of the span's operation.
  ///
  /// For example, the name can be a qualified method name or a file name
  /// and a line number where the operation is called. A best practice is to use
  /// the same display name at the same call point in an application.
  /// This makes it easier to correlate spans in different traces.
  ///
  /// This field is semantically required to be set to non-empty string.
  /// Empty value is equivalent to an unknown span name.
  ///
  /// This field is required.
  var name: String = String()

  /// Distinguishes between spans generated in a particular context. For example,
  /// two spans with the same name may be distinguished using `CLIENT` (caller)
  /// and `SERVER` (callee) to identify queueing latency associated with the span.
  var kind: Opentelemetry_Proto_Trace_V1_Span.SpanKind = .unspecified

  /// start_time_unix_nano is the start time of the span. On the client side, this is the time
  /// kept by the local machine where the span execution starts. On the server side, this
  /// is the time when the server's application handler starts running.
  /// Value is UNIX Epoch time in nanoseconds since 00:00:00 UTC on 1 January 1970.
  ///
  /// This field is semantically required and it is expected that end_time >= start_time.
  var startTimeUnixNano: UInt64 = 0

  /// end_time_unix_nano is the end time of the span. On the client side, this is the time
  /// kept by the local machine where the span execution ends. On the server side, this
  /// is the time when the server application handler stops running.
  /// Value is UNIX Epoch time in nanoseconds since 00:00:00 UTC on 1 January 1970.
  ///
  /// This field is semantically required and it is expected that end_time >= start_time.
  var endTimeUnixNano: UInt64 = 0

  /// attributes is a collection of key/value pairs. Note, global attributes
  /// like server name can be set using the resource API. Examples of attributes:
  ///
  ///     "/http/user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"
  ///     "/http/server_latency": 300
  ///     "example.com/myattribute": true
  ///     "example.com/score": 10.239
  ///
  /// The OpenTelemetry API specification further restricts the allowed value types:
  /// https://github.com/open-telemetry/opentelemetry-specification/blob/main/specification/common/README.md#attribute
  /// Attribute keys MUST be unique (it is not allowed to have more than one
  /// attribute with the same key).
  var attributes: [Opentelemetry_Proto_Common_V1_KeyValue] = []

  /// dropped_attributes_count is the number of attributes that were discarded. Attributes
  /// can be discarded because their keys are too long or because there are too many
  /// attributes. If this value is 0, then no attributes were dropped.
  var droppedAttributesCount: UInt32 = 0

  /// events is a collection of Event items.
  var events: [Opentelemetry_Proto_Trace_V1_Span.Event] = []

  /// dropped_events_count is the number of dropped events. If the value is 0, then no
  /// events were dropped.
  var droppedEventsCount: UInt32 = 0

  /// links is a collection of Links, which are references from this span to a span
  /// in the same or different trace.
  var links: [Opentelemetry_Proto_Trace_V1_Span.Link] = []

  /// dropped_links_count is the number of dropped links after the maximum size was
  /// enforced. If this value is 0, then no links were dropped.
  var droppedLinksCount: UInt32 = 0

  /// An optional final status for this span. Semantically when Status isn't set, it means
  /// span's status code is unset, i.e. assume STATUS_CODE_UNSET (code = 0).
  var status: Opentelemetry_Proto_Trace_V1_Status {
    get {return _status ?? Opentelemetry_Proto_Trace_V1_Status()}
    set {_status = newValue}
  }
  /// Returns true if `status` has been explicitly set.
  var hasStatus: Bool {return self._status != nil}
  /// Clears the value of `status`. Subsequent reads from it will return its default value.
  mutating func clearStatus() {self._status = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  /// SpanKind is the type of span. Can be used to specify additional relationships between spans
  /// in addition to a parent/child relationship.
  enum SpanKind: SwiftProtobuf.Enum {
    typealias RawValue = Int

    /// Unspecified. Do NOT use as default.
    /// Implementations MAY assume SpanKind to be INTERNAL when receiving UNSPECIFIED.
    case unspecified // = 0

    /// Indicates that the span represents an internal operation within an application,
    /// as opposed to an operation happening at the boundaries. Default value.
    case `internal` // = 1

    /// Indicates that the span covers server-side handling of an RPC or other
    /// remote network request.
    case server // = 2

    /// Indicates that the span describes a request to some remote service.
    case client // = 3

    /// Indicates that the span describes a producer sending a message to a broker.
    /// Unlike CLIENT and SERVER, there is often no direct critical path latency relationship
    /// between producer and consumer spans. A PRODUCER span ends when the message was accepted
    /// by the broker while the logical processing of the message might span a much longer time.
    case producer // = 4

    /// Indicates that the span describes consumer receiving a message from a broker.
    /// Like the PRODUCER kind, there is often no direct critical path latency relationship
    /// between producer and consumer spans.
    case consumer // = 5
    case UNRECOGNIZED(Int)

    init() {
      self = .unspecified
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .unspecified
      case 1: self = .internal
      case 2: self = .server
      case 3: self = .client
      case 4: self = .producer
      case 5: self = .consumer
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .unspecified: return 0
      case .internal: return 1
      case .server: return 2
      case .client: return 3
      case .producer: return 4
      case .consumer: return 5
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  /// Event is a time-stamped annotation of the span, consisting of user-supplied
  /// text description and key-value pairs.
  struct Event {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// time_unix_nano is the time the event occurred.
    var timeUnixNano: UInt64 = 0

    /// name of the event.
    /// This field is semantically required to be set to non-empty string.
    var name: String = String()

    /// attributes is a collection of attribute key/value pairs on the event.
    /// Attribute keys MUST be unique (it is not allowed to have more than one
    /// attribute with the same key).
    var attributes: [Opentelemetry_Proto_Common_V1_KeyValue] = []

    /// dropped_attributes_count is the number of dropped attributes. If the value is 0,
    /// then no attributes were dropped.
    var droppedAttributesCount: UInt32 = 0

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  /// A pointer from the current span to another span in the same trace or in a
  /// different trace. For example, this can be used in batching operations,
  /// where a single batch handler processes multiple requests from different
  /// traces or when the handler receives a request from a different project.
  struct Link {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// A unique identifier of a trace that this linked span is part of. The ID is a
    /// 16-byte array.
    var traceID: Data = Data()

    /// A unique identifier for the linked span. The ID is an 8-byte array.
    var spanID: Data = Data()

    /// The trace_state associated with the link.
    var traceState: String = String()

    /// attributes is a collection of attribute key/value pairs on the link.
    /// Attribute keys MUST be unique (it is not allowed to have more than one
    /// attribute with the same key).
    var attributes: [Opentelemetry_Proto_Common_V1_KeyValue] = []

    /// dropped_attributes_count is the number of dropped attributes. If the value is 0,
    /// then no attributes were dropped.
    var droppedAttributesCount: UInt32 = 0

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  init() {}

  fileprivate var _status: Opentelemetry_Proto_Trace_V1_Status? = nil
}

#if swift(>=4.2)

extension Opentelemetry_Proto_Trace_V1_Span.SpanKind: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Opentelemetry_Proto_Trace_V1_Span.SpanKind] = [
    .unspecified,
    .internal,
    .server,
    .client,
    .producer,
    .consumer,
  ]
}

#endif  // swift(>=4.2)

/// The Status type defines a logical error model that is suitable for different
/// programming environments, including REST APIs and RPC APIs.
struct Opentelemetry_Proto_Trace_V1_Status {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// A developer-facing human readable error message.
  var message: String = String()

  /// The status code.
  var code: Opentelemetry_Proto_Trace_V1_Status.StatusCode = .unset

  var unknownFields = SwiftProtobuf.UnknownStorage()

  /// For the semantics of status codes see
  /// https://github.com/open-telemetry/opentelemetry-specification/blob/main/specification/trace/api.md#set-status
  enum StatusCode: SwiftProtobuf.Enum {
    typealias RawValue = Int

    /// The default status.
    case unset // = 0

    /// The Span has been validated by an Application developer or Operator to 
    /// have completed successfully.
    case ok // = 1

    /// The Span contains an error.
    case error // = 2
    case UNRECOGNIZED(Int)

    init() {
      self = .unset
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .unset
      case 1: self = .ok
      case 2: self = .error
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .unset: return 0
      case .ok: return 1
      case .error: return 2
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}
}

#if swift(>=4.2)

extension Opentelemetry_Proto_Trace_V1_Status.StatusCode: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Opentelemetry_Proto_Trace_V1_Status.StatusCode] = [
    .unset,
    .ok,
    .error,
  ]
}

#endif  // swift(>=4.2)

#if swift(>=5.5) && canImport(_Concurrency)
extension Opentelemetry_Proto_Trace_V1_TracesData: @unchecked Sendable {}
extension Opentelemetry_Proto_Trace_V1_ResourceSpans: @unchecked Sendable {}
extension Opentelemetry_Proto_Trace_V1_ScopeSpans: @unchecked Sendable {}
extension Opentelemetry_Proto_Trace_V1_Span: @unchecked Sendable {}
extension Opentelemetry_Proto_Trace_V1_Span.SpanKind: @unchecked Sendable {}
extension Opentelemetry_Proto_Trace_V1_Span.Event: @unchecked Sendable {}
extension Opentelemetry_Proto_Trace_V1_Span.Link: @unchecked Sendable {}
extension Opentelemetry_Proto_Trace_V1_Status: @unchecked Sendable {}
extension Opentelemetry_Proto_Trace_V1_Status.StatusCode: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "opentelemetry.proto.trace.v1"

extension Opentelemetry_Proto_Trace_V1_TracesData: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".TracesData"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "resource_spans"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.resourceSpans) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.resourceSpans.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.resourceSpans, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Opentelemetry_Proto_Trace_V1_TracesData, rhs: Opentelemetry_Proto_Trace_V1_TracesData) -> Bool {
    if lhs.resourceSpans != rhs.resourceSpans {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opentelemetry_Proto_Trace_V1_ResourceSpans: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ResourceSpans"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "resource"),
    2: .standard(proto: "scope_spans"),
    3: .standard(proto: "schema_url"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._resource) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.scopeSpans) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.schemaURL) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._resource {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.scopeSpans.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.scopeSpans, fieldNumber: 2)
    }
    if !self.schemaURL.isEmpty {
      try visitor.visitSingularStringField(value: self.schemaURL, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Opentelemetry_Proto_Trace_V1_ResourceSpans, rhs: Opentelemetry_Proto_Trace_V1_ResourceSpans) -> Bool {
    if lhs._resource != rhs._resource {return false}
    if lhs.scopeSpans != rhs.scopeSpans {return false}
    if lhs.schemaURL != rhs.schemaURL {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opentelemetry_Proto_Trace_V1_ScopeSpans: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ScopeSpans"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "scope"),
    2: .same(proto: "spans"),
    3: .standard(proto: "schema_url"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._scope) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.spans) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.schemaURL) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._scope {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.spans.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.spans, fieldNumber: 2)
    }
    if !self.schemaURL.isEmpty {
      try visitor.visitSingularStringField(value: self.schemaURL, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Opentelemetry_Proto_Trace_V1_ScopeSpans, rhs: Opentelemetry_Proto_Trace_V1_ScopeSpans) -> Bool {
    if lhs._scope != rhs._scope {return false}
    if lhs.spans != rhs.spans {return false}
    if lhs.schemaURL != rhs.schemaURL {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opentelemetry_Proto_Trace_V1_Span: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Span"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "trace_id"),
    2: .standard(proto: "span_id"),
    3: .standard(proto: "trace_state"),
    4: .standard(proto: "parent_span_id"),
    5: .same(proto: "name"),
    6: .same(proto: "kind"),
    7: .standard(proto: "start_time_unix_nano"),
    8: .standard(proto: "end_time_unix_nano"),
    9: .same(proto: "attributes"),
    10: .standard(proto: "dropped_attributes_count"),
    11: .same(proto: "events"),
    12: .standard(proto: "dropped_events_count"),
    13: .same(proto: "links"),
    14: .standard(proto: "dropped_links_count"),
    15: .same(proto: "status"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.traceID) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.spanID) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.traceState) }()
      case 4: try { try decoder.decodeSingularBytesField(value: &self.parentSpanID) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 6: try { try decoder.decodeSingularEnumField(value: &self.kind) }()
      case 7: try { try decoder.decodeSingularFixed64Field(value: &self.startTimeUnixNano) }()
      case 8: try { try decoder.decodeSingularFixed64Field(value: &self.endTimeUnixNano) }()
      case 9: try { try decoder.decodeRepeatedMessageField(value: &self.attributes) }()
      case 10: try { try decoder.decodeSingularUInt32Field(value: &self.droppedAttributesCount) }()
      case 11: try { try decoder.decodeRepeatedMessageField(value: &self.events) }()
      case 12: try { try decoder.decodeSingularUInt32Field(value: &self.droppedEventsCount) }()
      case 13: try { try decoder.decodeRepeatedMessageField(value: &self.links) }()
      case 14: try { try decoder.decodeSingularUInt32Field(value: &self.droppedLinksCount) }()
      case 15: try { try decoder.decodeSingularMessageField(value: &self._status) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.traceID.isEmpty {
      try visitor.visitSingularBytesField(value: self.traceID, fieldNumber: 1)
    }
    if !self.spanID.isEmpty {
      try visitor.visitSingularBytesField(value: self.spanID, fieldNumber: 2)
    }
    if !self.traceState.isEmpty {
      try visitor.visitSingularStringField(value: self.traceState, fieldNumber: 3)
    }
    if !self.parentSpanID.isEmpty {
      try visitor.visitSingularBytesField(value: self.parentSpanID, fieldNumber: 4)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 5)
    }
    if self.kind != .unspecified {
      try visitor.visitSingularEnumField(value: self.kind, fieldNumber: 6)
    }
    if self.startTimeUnixNano != 0 {
      try visitor.visitSingularFixed64Field(value: self.startTimeUnixNano, fieldNumber: 7)
    }
    if self.endTimeUnixNano != 0 {
      try visitor.visitSingularFixed64Field(value: self.endTimeUnixNano, fieldNumber: 8)
    }
    if !self.attributes.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.attributes, fieldNumber: 9)
    }
    if self.droppedAttributesCount != 0 {
      try visitor.visitSingularUInt32Field(value: self.droppedAttributesCount, fieldNumber: 10)
    }
    if !self.events.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.events, fieldNumber: 11)
    }
    if self.droppedEventsCount != 0 {
      try visitor.visitSingularUInt32Field(value: self.droppedEventsCount, fieldNumber: 12)
    }
    if !self.links.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.links, fieldNumber: 13)
    }
    if self.droppedLinksCount != 0 {
      try visitor.visitSingularUInt32Field(value: self.droppedLinksCount, fieldNumber: 14)
    }
    try { if let v = self._status {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 15)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Opentelemetry_Proto_Trace_V1_Span, rhs: Opentelemetry_Proto_Trace_V1_Span) -> Bool {
    if lhs.traceID != rhs.traceID {return false}
    if lhs.spanID != rhs.spanID {return false}
    if lhs.traceState != rhs.traceState {return false}
    if lhs.parentSpanID != rhs.parentSpanID {return false}
    if lhs.name != rhs.name {return false}
    if lhs.kind != rhs.kind {return false}
    if lhs.startTimeUnixNano != rhs.startTimeUnixNano {return false}
    if lhs.endTimeUnixNano != rhs.endTimeUnixNano {return false}
    if lhs.attributes != rhs.attributes {return false}
    if lhs.droppedAttributesCount != rhs.droppedAttributesCount {return false}
    if lhs.events != rhs.events {return false}
    if lhs.droppedEventsCount != rhs.droppedEventsCount {return false}
    if lhs.links != rhs.links {return false}
    if lhs.droppedLinksCount != rhs.droppedLinksCount {return false}
    if lhs._status != rhs._status {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opentelemetry_Proto_Trace_V1_Span.SpanKind: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "SPAN_KIND_UNSPECIFIED"),
    1: .same(proto: "SPAN_KIND_INTERNAL"),
    2: .same(proto: "SPAN_KIND_SERVER"),
    3: .same(proto: "SPAN_KIND_CLIENT"),
    4: .same(proto: "SPAN_KIND_PRODUCER"),
    5: .same(proto: "SPAN_KIND_CONSUMER"),
  ]
}

extension Opentelemetry_Proto_Trace_V1_Span.Event: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Opentelemetry_Proto_Trace_V1_Span.protoMessageName + ".Event"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "time_unix_nano"),
    2: .same(proto: "name"),
    3: .same(proto: "attributes"),
    4: .standard(proto: "dropped_attributes_count"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularFixed64Field(value: &self.timeUnixNano) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.attributes) }()
      case 4: try { try decoder.decodeSingularUInt32Field(value: &self.droppedAttributesCount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.timeUnixNano != 0 {
      try visitor.visitSingularFixed64Field(value: self.timeUnixNano, fieldNumber: 1)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 2)
    }
    if !self.attributes.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.attributes, fieldNumber: 3)
    }
    if self.droppedAttributesCount != 0 {
      try visitor.visitSingularUInt32Field(value: self.droppedAttributesCount, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Opentelemetry_Proto_Trace_V1_Span.Event, rhs: Opentelemetry_Proto_Trace_V1_Span.Event) -> Bool {
    if lhs.timeUnixNano != rhs.timeUnixNano {return false}
    if lhs.name != rhs.name {return false}
    if lhs.attributes != rhs.attributes {return false}
    if lhs.droppedAttributesCount != rhs.droppedAttributesCount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opentelemetry_Proto_Trace_V1_Span.Link: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Opentelemetry_Proto_Trace_V1_Span.protoMessageName + ".Link"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "trace_id"),
    2: .standard(proto: "span_id"),
    3: .standard(proto: "trace_state"),
    4: .same(proto: "attributes"),
    5: .standard(proto: "dropped_attributes_count"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.traceID) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.spanID) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.traceState) }()
      case 4: try { try decoder.decodeRepeatedMessageField(value: &self.attributes) }()
      case 5: try { try decoder.decodeSingularUInt32Field(value: &self.droppedAttributesCount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.traceID.isEmpty {
      try visitor.visitSingularBytesField(value: self.traceID, fieldNumber: 1)
    }
    if !self.spanID.isEmpty {
      try visitor.visitSingularBytesField(value: self.spanID, fieldNumber: 2)
    }
    if !self.traceState.isEmpty {
      try visitor.visitSingularStringField(value: self.traceState, fieldNumber: 3)
    }
    if !self.attributes.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.attributes, fieldNumber: 4)
    }
    if self.droppedAttributesCount != 0 {
      try visitor.visitSingularUInt32Field(value: self.droppedAttributesCount, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Opentelemetry_Proto_Trace_V1_Span.Link, rhs: Opentelemetry_Proto_Trace_V1_Span.Link) -> Bool {
    if lhs.traceID != rhs.traceID {return false}
    if lhs.spanID != rhs.spanID {return false}
    if lhs.traceState != rhs.traceState {return false}
    if lhs.attributes != rhs.attributes {return false}
    if lhs.droppedAttributesCount != rhs.droppedAttributesCount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opentelemetry_Proto_Trace_V1_Status: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Status"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    2: .same(proto: "message"),
    3: .same(proto: "code"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 2: try { try decoder.decodeSingularStringField(value: &self.message) }()
      case 3: try { try decoder.decodeSingularEnumField(value: &self.code) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.message.isEmpty {
      try visitor.visitSingularStringField(value: self.message, fieldNumber: 2)
    }
    if self.code != .unset {
      try visitor.visitSingularEnumField(value: self.code, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Opentelemetry_Proto_Trace_V1_Status, rhs: Opentelemetry_Proto_Trace_V1_Status) -> Bool {
    if lhs.message != rhs.message {return false}
    if lhs.code != rhs.code {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Opentelemetry_Proto_Trace_V1_Status.StatusCode: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "STATUS_CODE_UNSET"),
    1: .same(proto: "STATUS_CODE_OK"),
    2: .same(proto: "STATUS_CODE_ERROR"),
  ]
}
