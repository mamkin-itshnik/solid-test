//
//  MonyeModel.swift
//  solid-test
//
//  Created by Евгений on 02.02.2022.
//

import Foundation

enum BalanceState{
    case checking
    case updated(BalanceData)
    
    struct BalanceData{
        var money: Decimal
    }
}
