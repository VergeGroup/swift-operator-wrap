
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
  
  func testOptional() {
    
    var optional: Int? = 42
    
    optional&>.do {
      print($0)
    }
    
    optional?&>.do {
      print($0)
    }
    
    do {
      
      var container: Container? = .init(value: 42)
      
      container?.value&>.do {
        print($0)
      }
      
    }
    
  }
  
  struct Container {
    
    var value: Int
    

  }
}
