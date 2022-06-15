precedencegroup WrapPrecedence {
  associativity: left
}

infix operator &>: WrapPrecedence
infix operator <&: WrapPrecedence

public func <& <T, O>(lhs: inout T, modifier: WrapModifier<T, O>) -> O {
  modifier.modify(&lhs)
}

@discardableResult
public func &> <T, O>(lhs: T, applier: WrapApplier<T, O>) -> O {
  applier.apply(lhs)
}

public struct WrapModifier<Input, Output> {
  
  public let modify: (inout Input) -> Output
  
  public init(_ modify: @escaping (inout Input) -> Output) {
    self.modify = modify
  }
  
  public static func modify(_ modify: @escaping (inout Input) -> Void) -> WrapModifier<Input, Void> {
    return .init {
      modify(&$0)
    }
  }
  
}

public struct WrapApplier<Input, Output> {
  
  public let apply: (Input) -> Output
  
  public init(_ apply: @escaping (Input) -> Output) {
    self.apply = apply
  }
    
  public static func `do`(_ applier: @escaping (Input) -> Void) -> WrapApplier<Input, Input> {
    return .init {
      applier($0)
      return $0
    }
  }
}
