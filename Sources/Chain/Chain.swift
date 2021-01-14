
public protocol _Chain_OptionalProtocol {
  associatedtype Wrapped
  var _chain_wrapped: Wrapped? { get }
}

extension Optional: _Chain_OptionalProtocol {
  public var _chain_wrapped: Wrapped? {
    self
  }
}

postfix operator &

public postfix func & <T>(argument: T) -> Chain<T> {
  .init(argument)
}

/**
 Starts method-chain statement
 */
public func chain<T>(_ value: @autoclosure () -> T) -> Chain<T> {
  .init(value())
}

/**
 Starts method-chain statement
 */
public func chain<T>(_ value: () -> T) -> Chain<T> {
  .init(value())
}

public struct Chain<Value> {

  public let value: Value

  public init(_ value: Value) {
    self.value = value
  }

}

extension Chain {

  public func map<U>(_ transform: (Value) throws -> U) rethrows -> Chain<U> {
    .init(try transform(value))
  }

  public func flatMap<U>(_ transform: (Value) throws -> Chain<U>) rethrows -> Chain<U> {
    .init(try transform(value).value)
  }

  @discardableResult
  public func `do`(_ applier: (Value) throws -> Void) rethrows -> Chain<Value> {
    try applier(value)
    return self
  }

  public func modify(_ modifier: (inout Value) throws -> Void) rethrows -> Chain<Value> {
    var v = value
    try modifier(&v)
    return .init(v)
  }

  public func filter(_ filter: (Value) -> Bool) -> Chain<Value?> {
    guard filter(value) else {
      return .init(nil)
    }
    return .init(value)
  }

  public func ifEmpty(_ fallbackValue: Value.Wrapped) -> Chain<Value.Wrapped> where Value : _Chain_OptionalProtocol {
    if let wrapped = self.value._chain_wrapped {
      return .init(wrapped)
    }
    return .init(fallbackValue)
  }

}
