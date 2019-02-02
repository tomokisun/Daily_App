//
//  ProductAPI.swift
//  FarmerEC
//
//  Created by 築山朋紀 on 2019/02/02.
//  Copyright © 2019 Aoki Riku. All rights reserved.
//

import Foundation

struct ProductAPI {
    private init() {}
    
    static func fetchProductShowRequest(id: String, completion: @escaping (APIDecodingResult<[ProductModel]>) -> Void) {
        let request = ProductShowRequest(id: id)
        APIClient.send(request, decodingCompletion: completion)
    }
}
