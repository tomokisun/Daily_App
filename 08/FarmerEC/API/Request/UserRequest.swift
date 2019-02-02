//
//  UserRequest.swift
//  FarmerEC
//
//  Created by 築山朋紀 on 2019/02/02.
//  Copyright © 2019 Aoki Riku. All rights reserved.
//

import Foundation
import Alamofire

struct UserRegisterRequest: APIRequest, DecodingRequest {
    var httpMethod: HTTPMethod { return .post }
    typealias Decoded = UserModel
    var path: String { return "/register" }
    
    var name: String
    var local: String
    
    var parameters: [String : String] {
        return [
            "name": name,
            "local": local
        ]
    }
}

struct UserIndexRequest: APIRequest, DecodingRequest {
    var httpMethod: HTTPMethod { return .post }
    
    var path: String { return "/user/index" }
    
    var parameters: [String : String] { return ["": ""] }
    
    typealias Decoded = [UserModel]
}

struct UserShowRequest: APIRequest, DecodingRequest {
    var httpMethod: HTTPMethod { return .post }
    
    var path: String { return "/user"}
    
    var id: String
    
    var parameters: [String : String] {
        return [
            "id": id
        ]
    }
    
    typealias Decoded = UserModel
    
    
}
