//
//  APIClient.swift
//  42
//
//  Created by 築山朋紀 on 2019/03/08.
//  Copyright © 2019 tomoki. All rights reserved.
//

import Alamofire

struct PostalAPI {
    static func fetch(x: String, y: String, completion: @escaping (APIDecodingResult<PostalModel>) -> Void) {
        let request = PostalRequest(x: x, y: y)
        APIClient.send(request, decodingCompletion: completion)
    }
}

struct PostalModel: Codable {
    let location: [LocationModel]
}

struct LocationModel: Codable {
    let city: String
    let city_kana: String
    let fown: String
    let postal: String
}

struct PostalRequest: DecodingRequest, ParametersProvider {
    var parameters: [String : String] {
        return [
            "method": "searchByGeoLocation",
            "x": x,
            "y": y
        ]
    }
    
    var x: String
    var y: String
    
    typealias Decoded = PostalModel
    
    var httpMethod: HTTPMethod { return .get }
    
    var path: String { return "/api/json" }
}

protocol APIRequest {
    var httpMethod: HTTPMethod { get }
    var path: String { get }
}

extension APIRequest {
    
    var headers: [String: String] {
        return [:]
    }
    
    var baseURL: URL {
        return URL(string: "http://geoapi.heartrails.com")!
    }
    
    var urlComponents: URLComponents {
        guard let urlComponents = URLComponents(string: "\(self.baseURL)\(self.path)") else {
            assertionFailure("\(self.baseURL)\(self.path)は無効なURLです。")
            return URLComponents()
        }
        print("\(self.baseURL)\(self.path)に\(self.httpMethod)のリクエストを送りました")
        return urlComponents
    }
}

// MARK: - ParametersProvider -
protocol ParametersProvider {
    var parameters: [String: String] { get }
}

// MARK: - DecodingRequest -
protocol DecodingRequest: APIRequest {
    associatedtype Decoded: Decodable
}

enum APIResult {
    case success
    case failure(Error, statusCode: Int?)
}

enum APIDecodingResult<Decoded: Decodable> {
    case success(Decoded)
    case failure(Error, statusCode: Int?)
    
    func concealingDecodedValue(afterHandlingBy decodedValueHandler: (Decoded) -> Void) -> APIResult {
        switch self {
        case .success(let decoded):
            decodedValueHandler(decoded)
            return .success
        case .failure(let error, let statuCode):
            return .failure(error, statusCode: statuCode)
        }
    }
}

struct APIClient {
    private init() {}
    
    /// Decodable
    static func send<Request: DecodingRequest>(_ request: Request,
                                               decodingCompletion: @escaping (APIDecodingResult<Request.Decoded>) -> Void) {
        request.alamofireRequest
            .responseJSON { response in
                let result: APIDecodingResult<Request.Decoded>
                defer { decodingCompletion(result) }
                
                let statusCode = response.response?.statusCode
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        assertionFailure("response.resultがsuccessならresponse.dataはnilでないはず")
                        result = .failure(NSError(), statusCode: statusCode)
                        return
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        let decoded = try decoder.decode(Request.Decoded.self, from: data)
                        result = .success(decoded)
                    } catch {
                        print("ERROR:", "\(type(of: Request.Decoded.self))型へのデコードに失敗しました")
                        debugPrint(error)
                        result = .failure(error, statusCode: statusCode)
                    }
                case .failure(let error):
                    print("ERROR:", "\(type(of: Request.Decoded.self))型へ変換するJSONが取得できませんでした")
                    result = .failure(error, statusCode: statusCode)
                }
        }
    }
}

private extension APIRequest {
    var alamofireRequest: DataRequest {
        return Alamofire.request(self.urlComponents,
                                 method: self.httpMethod,
                                 parameters: (self as? ParametersProvider)?.parameters,
                                 encoding: JSONEncoding.default,
                                 headers: self.headers)
            .validate(statusCode: 200..<300)
    }
}
