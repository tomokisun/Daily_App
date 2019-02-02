//
//  UserModel.swift
//  FarmerEC
//
//  Created by 築山朋紀 on 2019/02/02.
//  Copyright © 2019 Aoki Riku. All rights reserved.
//

import Foundation

struct UserModel: Codable {
    
    let name: String
    let local: String
    let product: String
    let review: String
}
