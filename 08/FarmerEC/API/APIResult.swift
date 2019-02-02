//
//  APIResult.swift
//  FarmerEC
//
//  Created by 築山朋紀 on 2019/02/02.
//  Copyright © 2019 Aoki Riku. All rights reserved.
//

import Alamofire

protocol APIRequest {
    var httpMethod: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: String] { get }
}

extension APIRequest {
    
    var version: URL {
        return URL(string: "/api/v1")!
    }
    
    var baseHost: String { return "http://192.168.100.19:3000/" }
    
    var urlComponents: URLComponents {
        guard let urlComponents = URLComponents(string: "\(self.baseHost)\(self.version)\(self.path)") else {
            assertionFailure("\(self.path)は無効なURLです")
            return URLComponents()
        }
        return urlComponents
    }
}

protocol DecodingRequest: APIRequest {
    associatedtype Decoded: Decodable
}

