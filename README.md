# & - chain

A tiny library that enables us to describe operations in method-chain.

## Usage

```swift

let result: String = ""&.map { Int($0) }.do { print($0 as Any) }.value

let value: String = ""&.filter { !$0.isEmpty }.ifEmpty("b").value

let view: UIView = UIView()&.do {
  $0.backgroundColor = .white
}.value
```

## Motivation

Actually, I'm not addict to that getting a custom operator.  
However **a global function** or **operator** are only way to add a new feature without customizing our own types.

Other way is using something protocol and extending it like this.  
It can not be used in struct without adding that protocol.

`&` opeartor or `chain` global function these returns wrapper value `Chain<Value>`.

```swift
let text = ""

let chain: Chain<String> = chain(text)
```

```swift
let text = ""

let chain: Chain<String> = text&
```

This wrapper structure enables method-chain.
In exchange, it needs to `Chain<String>.value` at the end of method-chain.


In fact, this structure looks very natural, because the all of method chaining in Swift standard libary come from an kind of monad.  
Like, `Optional`, `Array` and `Dictionary`.

And this keeps Swift clean code base at the beginning.  
You have no methods at you declared a struct!
