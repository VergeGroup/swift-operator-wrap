
import XCTest
import Wrap

final class WrapTests: XCTestCase {

  func testWrap() {
    let value = 42
    let wrapped = value&>
      .map { $0 + 1 }
    XCTAssertEqual(wrapped, 43)
  }

  func testModify() {
    var value = 42
    value <& { $0 += 1 }
    XCTAssertEqual(value, 43)
  }
}
