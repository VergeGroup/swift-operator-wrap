
postfix operator &>
infix operator <&

public postfix func &> <T>(argument: consuming T) -> _FlowDownBox<T> {
  .init(consume argument)
}

public func <& <T>(argument: inout T, modifier: (inout T) throws -> Void) rethrows {
  try modifier(&argument)
}

public struct _FlowDownBox<Value>: ~Copyable {

  public var value: Value

  public init(_ value: consuming Value) {
    self.value = consume value
  }

}

public func modify<Value>(_ value: inout Value, _ modifier: (inout Value) throws -> Void, isolation: isolated (any Actor)? = #isolation) rethrows {
  try modifier(&value)
}

extension _FlowDownBox {

  public consuming func map<U>(_ transform: (consuming Value) throws -> U, isolation: isolated (any Actor)? = #isolation) rethrows -> U {
    try transform(value)
  }

  @discardableResult
  public consuming func `do`(_ applier: (consuming Value) throws -> Void, isolation: isolated (any Actor)? = #isolation) rethrows -> Value {
    try applier(value)
    return value
  }

  @discardableResult
  @_disfavoredOverload
  public consuming func `do`(_ applier: (consuming Value) throws -> Void, isolation: isolated (any Actor)? = #isolation) rethrows -> Value? {
    try applier(value)
    return value
  }

  public consuming func modify(_ modifier: (inout Value) throws -> Void, isolation: isolated (any Actor)? = #isolation) rethrows -> Value {
    try modifier(&value)
    return value
  }

  public consuming func filter(_ filter: (consuming Value) -> Bool, isolation: isolated (any Actor)? = #isolation) -> Value? {
    guard filter(value) else {
      return nil
    }
    return value
  }

}

