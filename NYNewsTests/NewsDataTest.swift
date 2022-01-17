//
//  NewsDataTest.swift
//  NYNewsTests
//
//  Created by gamal oraby on 16/01/2022.
//

import XCTest
@testable import NYNews

class NewsDataTest: XCTestCase {
    func testCanParseNews() throws {
        guard let path = Bundle(for: type(of: self)).path(forResource: "NewsData", ofType: "json") else {
            fatalError("json not found")
        }
        
        guard let json = try? String(contentsOfFile: path, encoding: .utf8) else {
            fatalError("cont convert json")
        }
        
        let jsonData = json.data(using: .utf8)
        let newsData = try JSONDecoder().decode(APIResponse.self, from: jsonData!)
        XCTAssertEqual("Underwater Volcano Erupts, Setting Off Tsunami Warnings Across Pacific", newsData.results[0].title)
        XCTAssertGreaterThan(newsData.results[0].media.count, 0)
        XCTAssertNotNil(newsData.results[0].abstract)
    }
}
