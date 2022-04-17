import XCTest

import Wrap

final class Tests: XCTestCase {
  
  func testApplier() {
    
    "" &> .do { _ in
      
    }
    
    "" &> .do { _ in
      
    }
    
    var text = ""
    
    text <& .modify {
      $0 = "muuk"
    }
    
    XCTAssertEqual(text, "muuk")
    
  }
  
}
