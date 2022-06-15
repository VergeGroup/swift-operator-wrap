import XCTest

import Wrap

final class Tests: XCTestCase {
  
  func testApplier() {
     
    "1" &> .do {
      XCTAssertEqual($0, "1")
    }
    
    var text = ""
    
    text <& .modify {
      $0 = "muuk"
    }
    
    XCTAssertEqual(text, "muuk")
    
  }
  
}
