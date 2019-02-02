//
//  APIClient.swift
//  FarmerEC
//
//  Created by 築山朋紀 on 2019/02/02.
//  Copyright © 2019 Aoki Riku. All rights reserved.
//

import Alamofire

struct APIClient {
    
    private init() {}
    
    /// responseが帰ってこないとき
    static func send<Request: APIRequest>(_ request: Request,
                                          preprocessOnSuccess: @escaping () -> Void = {},
                                          completion: @escaping (APIResult) -> Void) {
        request.alamofireRequest
            .responseString { response in
                let result: APIResult
                defer { completion(result) }
                
                switch response.result {
                case .success(_):
                    preprocessOnSuccess()
                    result = .success
                case .failure(let error):
                    result = .failure(error, statusCode: response.response?.statusCode)
                }
        }
    }
    
    /// responseがあるとき
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
                                 parameters: self.parameters,
                                 encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
    }
    
}
