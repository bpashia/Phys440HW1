//
//  Tests_macOS.swift
//  Tests macOS
//
//  Created by Broc Pashia on 1/21/22
//

import XCTest

class Tests_macOS: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSphereInitialization() async {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let radius = 1.0
        
        let mySphere = Sphere()
        
        let _ = await mySphere.initWithRadius(radius: radius)
        
        let volume = mySphere.volume
        
        XCTAssertEqual(volume, 4.0/3.0 * Double.pi, accuracy: 1.0E-7, "Was not equal to this resolution.")
        
        let surfaceArea = mySphere.surfaceArea
        
        XCTAssertEqual(surfaceArea, 4.0*Double.pi, accuracy: 1.0E-7, "Was not equal to this resolution.")
        
        let boundingBoxVolume = mySphere.boundingBox.volume
        
        XCTAssertEqual(boundingBoxVolume,8.0, accuracy: 1.0E-7, "Was not equal to this resolution.")
        
        let boundingBoxSurfaceArea = mySphere.boundingBox.surfaceArea
        
        XCTAssertEqual(boundingBoxSurfaceArea, 24.0*Double.pi, accuracy: 1.0E-7, "Was not equal to this resolution.")
        
        
    }

    

    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
