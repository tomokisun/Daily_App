//
//  ProductRequest.swift
//  FarmerEC
//
//  Created by 築山朋紀 on 2019/02/02.
//  Copyright © 2019 Aoki Riku. All rights reserved.
//

import Alamofire

struct ProductShowRequest: APIRequest, DecodingRequest {
    var httpMethod: HTTPMethod { return .post }
    
    var path: String { return "/product" }
    var id: String
    var parameters: [String : String] {
        return [
            "id": id
        ]
    }
    typealias Decoded = [ProductModel]
}
