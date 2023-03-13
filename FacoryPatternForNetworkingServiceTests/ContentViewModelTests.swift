//
//  ContentViewModelTests.swift
//  FacoryPatternForNetworkingServiceTests
//
//  Created by Michelle Grover on 3/12/23.
//

import Foundation
import XCTest

@testable import FacoryPatternForNetworkingService

class ContentViewModelTests: XCTestCase {
    var networkingService: NetworkingService!
    
    
    override func setUp() {
        super.setUp()
        networkingService = NetworkingServiceFactory.makeMockNetworkingService()
        
    }
    
    override func tearDown() {
        networkingService = nil
        super.tearDown()
    }
    
    func testFetchAcronyms() {
        networkingService.fetchAcronyms(for: "xi") { result in
            switch result {
            case .success(let acronyms):
               XCTAssertEqual(acronyms.count, 1)
               XCTAssertEqual(acronyms[0].sf, "XM")
               XCTAssertEqual(acronyms[0].lfs.count, 4)
               XCTAssertEqual(acronyms[0].lfs[0].lf, "X chromosome")
               XCTAssertEqual(acronyms[0].lfs[0].freq, 7)
               XCTAssertEqual(acronyms[0].lfs[0].since, 1979)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
