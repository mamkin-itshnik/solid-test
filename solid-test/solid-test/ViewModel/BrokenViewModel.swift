//
//  BrokenViewModel.swift
//  solid-test
//
//  Created by Евгений on 02.02.2022.
//

import Foundation


//MARK: lazy way for implement bad MoneyViewModelProtocol
class BrokenViewModel: MoneyViewModel{
    override func increaseMoney() {
        currentViewData.money -= 77
        updateState()
    }
    
    override func decreaseMoney() {
        currentViewData.money += 10
        updateState()
    }
}
