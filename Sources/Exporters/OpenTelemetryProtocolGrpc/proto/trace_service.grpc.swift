//
// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the protocol buffer compiler.
// Source: opentelemetry/proto/collector/trace/v1/trace_service.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
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
//
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf


/// Service that can be used to push spans between one Application instrumented with
/// OpenTelemetry and a collector, or between a collector and a central collector (in this
/// case spans are sent/received to/from multiple Applications).
///
/// Usage: instantiate `Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClient`, then call methods of this protocol to make API calls.
internal protocol Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientInterceptorFactoryProtocol? { get }

  func export(
    _ request: Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceRequest, Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceResponse>
}

extension Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientProtocol {
  internal var serviceName: String {
    return "opentelemetry.proto.collector.trace.v1.TraceService"
  }

  /// For performance reasons, it is recommended to keep this RPC
  /// alive for the entire life of the application.
  ///
  /// - Parameters:
  ///   - request: Request to send to Export.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func export(
    _ request: Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceRequest, Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceResponse> {
    return self.makeUnaryCall(
      path: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientMetadata.Methods.export.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeExportInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Opentelemetry_Proto_Collector_Trace_V1_TraceServiceNIOClient")
internal final class Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClient: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the opentelemetry.proto.collector.trace.v1.TraceService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Opentelemetry_Proto_Collector_Trace_V1_TraceServiceNIOClient: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the opentelemetry.proto.collector.trace.v1.TraceService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Service that can be used to push spans between one Application instrumented with
/// OpenTelemetry and a collector, or between a collector and a central collector (in this
/// case spans are sent/received to/from multiple Applications).
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Opentelemetry_Proto_Collector_Trace_V1_TraceServiceAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientInterceptorFactoryProtocol? { get }

  func makeExportCall(
    _ request: Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceRequest, Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Opentelemetry_Proto_Collector_Trace_V1_TraceServiceAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientMetadata.serviceDescriptor
  }

  internal var interceptors: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeExportCall(
    _ request: Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceRequest, Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceResponse> {
    return self.makeAsyncUnaryCall(
      path: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientMetadata.Methods.export.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeExportInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Opentelemetry_Proto_Collector_Trace_V1_TraceServiceAsyncClientProtocol {
  internal func export(
    _ request: Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceResponse {
    return try await self.performAsyncUnaryCall(
      path: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientMetadata.Methods.export.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeExportInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Opentelemetry_Proto_Collector_Trace_V1_TraceServiceAsyncClient: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'export'.
  func makeExportInterceptors() -> [ClientInterceptor<Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceRequest, Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceResponse>]
}

internal enum Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "TraceService",
    fullName: "opentelemetry.proto.collector.trace.v1.TraceService",
    methods: [
      Opentelemetry_Proto_Collector_Trace_V1_TraceServiceClientMetadata.Methods.export,
    ]
  )

  internal enum Methods {
    internal static let export = GRPCMethodDescriptor(
      name: "Export",
      path: "/opentelemetry.proto.collector.trace.v1.TraceService/Export",
      type: GRPCCallType.unary
    )
  }
}

/// Service that can be used to push spans between one Application instrumented with
/// OpenTelemetry and a collector, or between a collector and a central collector (in this
/// case spans are sent/received to/from multiple Applications).
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Opentelemetry_Proto_Collector_Trace_V1_TraceServiceProvider: CallHandlerProvider {
  var interceptors: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceServerInterceptorFactoryProtocol? { get }

  /// For performance reasons, it is recommended to keep this RPC
  /// alive for the entire life of the application.
  func export(request: Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceResponse>
}

extension Opentelemetry_Proto_Collector_Trace_V1_TraceServiceProvider {
  internal var serviceName: Substring {
    return Opentelemetry_Proto_Collector_Trace_V1_TraceServiceServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Export":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceRequest>(),
        responseSerializer: ProtobufSerializer<Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceResponse>(),
        interceptors: self.interceptors?.makeExportInterceptors() ?? [],
        userFunction: self.export(request:context:)
      )

    default:
      return nil
    }
  }
}

/// Service that can be used to push spans between one Application instrumented with
/// OpenTelemetry and a collector, or between a collector and a central collector (in this
/// case spans are sent/received to/from multiple Applications).
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Opentelemetry_Proto_Collector_Trace_V1_TraceServiceAsyncProvider: CallHandlerProvider, Sendable {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceServerInterceptorFactoryProtocol? { get }

  /// For performance reasons, it is recommended to keep this RPC
  /// alive for the entire life of the application.
  func export(
    request: Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Opentelemetry_Proto_Collector_Trace_V1_TraceServiceAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Opentelemetry_Proto_Collector_Trace_V1_TraceServiceServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Opentelemetry_Proto_Collector_Trace_V1_TraceServiceServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Opentelemetry_Proto_Collector_Trace_V1_TraceServiceServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Export":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceRequest>(),
        responseSerializer: ProtobufSerializer<Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceResponse>(),
        interceptors: self.interceptors?.makeExportInterceptors() ?? [],
        wrapping: { try await self.export(request: $0, context: $1) }
      )

    default:
      return nil
    }
  }
}

internal protocol Opentelemetry_Proto_Collector_Trace_V1_TraceServiceServerInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when handling 'export'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeExportInterceptors() -> [ServerInterceptor<Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceRequest, Opentelemetry_Proto_Collector_Trace_V1_ExportTraceServiceResponse>]
}

internal enum Opentelemetry_Proto_Collector_Trace_V1_TraceServiceServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "TraceService",
    fullName: "opentelemetry.proto.collector.trace.v1.TraceService",
    methods: [
      Opentelemetry_Proto_Collector_Trace_V1_TraceServiceServerMetadata.Methods.export,
    ]
  )

  internal enum Methods {
    internal static let export = GRPCMethodDescriptor(
      name: "Export",
      path: "/opentelemetry.proto.collector.trace.v1.TraceService/Export",
      type: GRPCCallType.unary
    )
  }
}
