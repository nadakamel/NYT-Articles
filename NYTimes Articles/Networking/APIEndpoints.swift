//
//  APIEndpoints.swift
//  NYTimes Articles
//
//  Created by Nada Kamel on 10/02/2021.
//

import Moya

enum APIEndpoints {
    static private let apiKey = "SJcAGRwPd7uZcW04yhUH1ABZts7V9NVz"
    
    case mostPopular(period: Int)
}

extension APIEndpoints: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.nytimes.com/svc") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .mostPopular(let period):
            return "\(baseURL)/mostpopular/v2/viewed/\(period).json?api-key=\(APIEndpoints.apiKey)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
