//
//  APIRequest.swift
//  FarmerEC
//
//  Created by 築山朋紀 on 2019/02/02.
//  Copyright © 2019 Aoki Riku. All rights reserved.
//

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
        case .failure(let error, let statusCode):
            return .failure(error, statusCode: statusCode)
        }
    }
}


