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

**a global function** or **operator** are only way to add a new feature without customizing our own types.
