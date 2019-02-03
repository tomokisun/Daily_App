//
//  CalculatorModel.swift
//  09
//
//  Created by 築山朋紀 on 2019/02/03.
//  Copyright © 2019 tomoki. All rights reserved.
//

import Foundation

enum Arithmetic {
    case plus
    case minus
    case multiply
    case division
}

class CalculatorModel {
    private var number1 = 0
    private var number2 = 0
    private var arithmetic: Arithmetic = .plus
    
    func number(num: Int) -> String {
        number1 = number1 * 10 + num
        return String(number1)
    }
    
    func calculator(num: Int) {
        number2 = number1
        number1 = 0
        switch num {
        case 1:
            arithmetic = .plus
        case 2:
            arithmetic = .minus
        case 3:
            arithmetic = .multiply
        case 4:
            arithmetic = .division
        default:
            break
        }
    }
    
    func equal() -> String {
        var num = 0
        switch arithmetic {
        case .plus:
            num = number2 + number1
        case .minus:
            num = number2 - number1
        case .multiply:
            num = number2 * number1
        case .division:
            num = number2 / number1
        }
        print(number1)
        print(number2)
        print(num)
        return String(num)
    }
}
