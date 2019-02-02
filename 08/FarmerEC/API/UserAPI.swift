//
//  UserAPI.swift
//  FarmerEC
//
//  Created by 築山朋紀 on 2019/02/02.
//  Copyright © 2019 Aoki Riku. All rights reserved.
//

import Foundation

struct UserAPI {
    
    private init() {}
    
    /// 新規登録
    static func fetchUserRegister(name: String, local: String, completion: @escaping (APIDecodingResult<UserModel>) -> Void) {
        let request = UserRegisterRequest(name: name, local: local)
        APIClient.send(request, decodingCompletion: completion)
    }
    
    /// 全部取得
    static func fetchUserIndexRequest(completion: @escaping (APIDecodingResult<[UserModel]>) -> Void) {
        let request = UserIndexRequest()
        APIClient.send(request, decodingCompletion: completion)
    }
    
    static func fetchUserShowrequest(id: String, completion: @escaping (APIDecodingResult<UserModel>) -> Void) {
        let request = UserShowRequest(id: id)
        APIClient.send(request, decodingCompletion: completion)
    }
}
