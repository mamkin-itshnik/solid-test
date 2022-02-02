//
//  MoneyViewModel.swift
//  solid-test
//
//  Created by Евгений on 02.02.2022.
//

import Foundation

protocol MoneyViewModelProtocol{
    var updateViewData: ((BalanceState)->())? {get set}
    var currentViewData: BalanceState.BalanceData {get set}
    
    func increaseMoney()
    func decreaseMoney()
}

class MoneyViewModel: MoneyViewModelProtocol{
    var updateViewData: ((BalanceState) -> ())?
    var currentViewData: BalanceState.BalanceData
    
    init() {
        currentViewData = BalanceState.BalanceData(money: 0)
    }
    
    func increaseMoney() {
        currentViewData.money += 1
        updateState()
    }
    
    func decreaseMoney() {
        currentViewData.money -= 1
        updateState()
    }
    
    func updateState(){
        DispatchQueue.main.async {[weak self] in
            guard let data = self?.currentViewData else { return }
            self?.updateViewData?(.updated(data))
        }
    }
}
