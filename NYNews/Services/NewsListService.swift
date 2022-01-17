//
//  NewsListService.swift
//  NYNews
//
//  Created by gamal oraby on 14/01/2022.
//

import Foundation
import Moya

enum NewsListService {
    case getNewsData(key: String)
}

// MARK: - TargetType Protocol Implementation
extension NewsListService: TargetType {
     var baseURL: URL { URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed")! }
     var path: String {
        switch self {
        case .getNewsData(_):
                return "1.json"
        }
    }
     var method: Moya.Method {
        switch self {
        case .getNewsData:
            return .get
        }
    }
     var task: Task {
        switch self {
        case let .getNewsData(key):
            return .requestParameters(parameters: ["api-key": key], encoding: URLEncoding.queryString)
        }
    }
     var sampleData: Data {
        switch self {
        case .getNewsData(let key):
            return "{\"api-key\": \(key)\"}".utf8Encoded
        }
    }
     var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data { Data(self.utf8) }
}
