//
//  KainanTests.swift
//  KainanTests
//
//  Created by Fulltime on 15/10/2017.
//  Copyright © 2017 University of the Philippines. All rights reserved.
//

import XCTest
@testable import Kainan

class KainanTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //MARK: Meal Class Tests
    
    func testMealInitializationSucceeds() {
        let zeroRating = Meal(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRating)
        
        let positiveRating = Meal(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRating)
    }
    
    func testMealInitializationFails() {
        
        let negativeRating = Meal(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRating)
        
        let largeRating = Meal(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRating)
        
        let emptyName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyName)
        
    }
    
}
