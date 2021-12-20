
postfix operator &>

public postfix func &> <T>(argument: T) -> Wrap<T> {
  .init(argument)
}

public struct Wrap<Value> {

  public let value: Value

  public init(_ value: Value) {
    self.value = value
  }
  
}

public func modify<Value>(_ value: inout Value, _ modifier: (inout Value) -> Void) {
  modifier(&value)
}

extension Wrap {

  public func map<U>(_ transform: (Value) throws -> U) rethrows -> U {
    try transform(value)
  }

  @discardableResult
  public func `do`(_ applier: (Value) throws -> Void) rethrows -> Value where Value : AnyObject {
    try applier(value)
    return value
  }
  
  public func modify(_ modifier: (inout Value) throws -> Void) rethrows -> Value {
    var v = value
    try modifier(&v)
    return v
  }

  public func filter(_ filter: (Value) -> Bool) -> Value? {
    guard filter(value) else {
      return nil
    }
    return value
  }
  
}
