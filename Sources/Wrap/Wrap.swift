
infix operator &>

public func &> <T, O>(lhs: inout T, modifier: Modifier<T, O>) -> O {
  modifier.modify(&lhs)
}

@discardableResult
public func &> <T, O>(lhs: T, applier: Applier<T, O>) -> O {
  applier.apply(lhs)
}

public struct Modifier<T, O> {
  
  public let modify: (inout T) -> O
  
  public init(_ modify: @escaping (inout T) -> O) {
    self.modify = modify
  }
  
}

public struct Applier<T, O> {
  
  public let apply: (T) -> O
  
  public init(_ apply: @escaping (T) -> O) {
    self.apply = apply
  }
    
  public static func `do`(_ applier: @escaping (T) -> Void) -> Applier<T, T> {
    return .init {
      applier($0)
      return $0
    }
  }
}

public func modify<Value>(_ value: inout Value, _ modifier: (inout Value) -> Void) {
  modifier(&value)
}
//
//extension Wrap {
//
//  public func map<U>(_ transform: (Value) throws -> U) rethrows -> U {
//    try transform(value)
//  }
//
//  @discardableResult
//  public func `do`(_ applier: (Value) throws -> Void) rethrows -> Value where Value : AnyObject {
//    try applier(value)
//    return value
//  }
//  
//  public func modify(_ modifier: (inout Value) throws -> Void) rethrows -> Value {
//    var v = value
//    try modifier(&v)
//    return v
//  }
//
//  public func filter(_ filter: (Value) -> Bool) -> Value? {
//    guard filter(value) else {
//      return nil
//    }
//    return value
//  }
//  
//}
