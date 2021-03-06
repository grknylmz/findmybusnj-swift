//
//  JsonTestHelper.swift
//  findmybusnj
//
//  Created by David Aghassi on 2/26/16.
//  Copyright © 2016 David Aghassi. All rights reserved.
//

import XCTest

// MARK: Dependancies
import SwiftyJSON

extension XCTestCase {
  /**
   Loads json from the json file in the test bundle and returns a `JSON` object from it
   
   - parameter fileName: The name of the file being searched for
   
   - returns: `JSON` object if the file is found, `nil` otherwise.
   */
  func loadJSONFromFile(fileName: String) -> JSON {
    var jsonData: NSData = NSData()
    
    let path = NSBundle(forClass: self.dynamicType).pathForResource(fileName, ofType: "json")
    XCTAssertNotNil(path, "Failed to get path to json file. Double check that the file is added to the test bundle.")
    
    do {
      // At this point we know it is safe to unwrap the path because we asserted prior
      try jsonData = NSData(contentsOfFile: path!, options: .DataReadingMappedIfSafe)
    }
    catch let error as NSError {
      print(error.localizedDescription)
    }
    
    let responseJSON = JSON(data: jsonData)
    return responseJSON
  }
}

enum JSONFileName: String {
  case singleStop = "singleStop"
  case stopWithAmpersand = "singleStopWithAmpersand"
  case noPrediction = "noPrediction"
}