# & - chain

An experimental project of creating method chain API using something like Monad.

## Usage

```swift

let result: String = ""&.map { Int($0) }.do { print($0 as Any) }.value

let value: String = ""&.filter { !$0.isEmpty }.ifEmpty("b").value

let view: UIView = UIView()&.do {
  $0.backgroundColor = .white
}.value
```
