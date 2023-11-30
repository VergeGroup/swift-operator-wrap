
postfix operator &>

public postfix func &> <T>(argument: consuming T) -> Wrap<T> {
  .init(consume argument)
}

public struct Wrap<Value>: ~Copyable {

  public let value: Value

  public init(_ value: consuming Value) {
    self.value = consume value
  }

}

public func modify<Value>(_ value: inout Value, _ modifier: (inout Value) throws -> Void) rethrows {
  try modifier(&value)
}

extension Wrap {

  public borrowing func map<U>(_ transform: (consuming Value) throws -> U) rethrows -> U {
    try transform(value)
  }

  @discardableResult
  public borrowing func `do`(_ applier: (borrowing Value) throws -> Void) rethrows -> Value {
    try applier(value)
    return value
  }

  @discardableResult
  @_disfavoredOverload
  public borrowing func `do`(_ applier: (borrowing Value) throws -> Void) rethrows -> Value? {
    try applier(value)
    return value
  }

  public borrowing func modify(_ modifier: (inout Value) throws -> Void) rethrows -> Value {
    var v = value
    try modifier(&v)
    return v
  }

  public borrowing func filter(_ filter: (borrowing Value) -> Bool) -> Value? {
    guard filter(value) else {
      return nil
    }
    return value
  }

}

