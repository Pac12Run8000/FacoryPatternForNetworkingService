//
//  ContentStubbingTests.swift
//  FacoryPatternForNetworkingServiceTests
//
//  Created by Michelle Grover on 3/16/23.
//

import XCTest
import Foundation

@testable import FacoryPatternForNetworkingService

final class ContentStubbingTests: XCTestCase {
    
    var jsonData: Data!
    var expectedModel: AcronymObject!
    var decoder: JSONDecoder!
    var contentView:ContentView!

    override func setUpWithError() throws {
        try super.setUpWithError()
                
        jsonData = Data(StubData.jsonEncoded)
        expectedModel = AcronymObject()
        decoder = JSONDecoder()
        contentView = ContentView()
    }

    override func tearDownWithError() throws {
        jsonData = nil
        expectedModel = nil
        decoder = nil
        contentView = nil
        try super.tearDownWithError()
    }

    func testDecodeWithModel() throws {
           // Act
           let actualModel = try decoder.decode(AcronymObject.self, from: jsonData)
           XCTAssertEqual(actualModel, StubDataConstants.exampleObject1)
    }
    
    func testGetAllLfs() throws {
        var lfs = [String]()
        let acronymObject = try decoder.decode(AcronymObject.self, from: jsonData)
        for acronym in acronymObject {
            for lf in acronym.lfs {
                lfs.append(lf.lf)
            }
        }
        XCTAssertEqual(lfs.count, 64)
    }
    
    func testModelOperatesCorrectly() throws {
        let acronymObject = try decoder.decode(AcronymObject.self, from: jsonData)
        contentView.displayList(acronymObject: acronymObject) { list in
            XCTAssertEqual(list.count, 64)
        }
        
    }

}
