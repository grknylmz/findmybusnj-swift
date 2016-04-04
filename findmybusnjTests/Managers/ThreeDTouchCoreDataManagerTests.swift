//
//  ThreeDTouchCoreDataManagerTests.swift
//  findmybusnj
//
//  Created by David Aghassi on 4/3/16.
//  Copyright © 2016 David Aghassi. All rights reserved.
//

import XCTest
import CoreData
@testable import findmybusnj

class ThreeDTouchCoreDataManagerTests: XCTestCase {
  var managedObjectContext = setUpInMemoryManagedObjectContext()
  var managerUnderTest: ThreeDTouchCoreDataManager!
  var lastFavorite: Favorite?
  
  override func setUp() {
    super.setUp()
    
    managerUnderTest = ThreeDTouchCoreDataManager(managedObjectContext: managedObjectContext)
    XCTAssertNotNil(managedObjectContext, "Managed Object Context may not be nil when running these tests")
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
    if let insertedObject = lastFavorite {
      managedObjectContext.deleteObject(insertedObject)
      do {
        try managedObjectContext.save()
      } catch {
        fatalError("Unable to save stop: \(error)")
      }
    }
  }
  
  /**
   `isDuplicate()` should never return true because it is unimplemented and set to return `false`
   */
  func test_Assert_isDuplicate_Always_False() {
    let emptyFetch = NSFetchRequest()
    let emptyPredicate = NSPredicate()
    let result = managerUnderTest.isDuplicate(emptyFetch, predicate: emptyPredicate)
    XCTAssertFalse(result, "isDuplicate is unimplemented for 3D Touch, this should never return true")
  }
  
  /**
   `attemptToSave` should never return true because it is unimplemented and set to return `false`
   */
  func test_Assert_attemptToSave_Always_False() {
    let emptyManagedObject = NSManagedObject()
    let result = managerUnderTest.attemptToSave(emptyManagedObject)
    XCTAssertFalse(result, "attemptToSave is unimplemented for 3D Touch, this should never return true")
  }
}