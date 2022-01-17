//
//  NewsViewModelTests.swift
//  NYNewsTests
//
//  Created by gamal oraby on 16/01/2022.
//

import XCTest
@testable import NYNews

class NewsViewModelTests: XCTestCase {
    
    func testCreaDetailsObject() throws {
        let viewModel = MainNewsViewModel()
        guard let path = Bundle(for: type(of: self)).path(forResource: "NewsData", ofType: "json") else {
            fatalError("json not found")
        }
        
        guard let json = try? String(contentsOfFile: path, encoding: .utf8) else {
            fatalError("cont convert json")
        }
        
        let jsonData = json.data(using: .utf8)
        let newsData = try JSONDecoder().decode(APIResponse.self, from: jsonData!)
        XCTAssertNotNil(viewModel.createDetailsObj(detailsObj: newsData, index: 0))
    }
    
    func testCreaCellObject() throws {
        let viewModel = MainNewsViewModel()
        guard let path = Bundle(for: type(of: self)).path(forResource: "NewsData", ofType: "json") else {
            fatalError("json not found")
        }
        
        guard let json = try? String(contentsOfFile: path, encoding: .utf8) else {
            fatalError("cont convert json")
        }
        
        let jsonData = json.data(using: .utf8)
        let newsData = try JSONDecoder().decode(APIResponse.self, from: jsonData!)
        XCTAssertNotNil(viewModel.createCellObj(detailsObj: newsData, index: 0))
    }
    
}
