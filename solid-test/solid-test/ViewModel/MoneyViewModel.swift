//
//  MoneyViewModel.swift
//  solid-test
//
//  Created by Евгений on 02.02.2022.
//

import UIKit

protocol MoneyViewModelProtocol{
    var updateViewData: ((BalanceState)->())? { get set }
    var currentViewData: BalanceState.BalanceData { get set }
    
    func increaseMoney()
    func decreaseMoney()
    
    //MARK: SRP disturbance
    var addIncreaseButton: UIButton! { get set }
    var addDecreaseButton: UIButton! { get set }
    var balanceLabel: UILabel! { get set }
    
    func makeIncreaseMoneyButton() -> UIButton
    func makeDecreaseMoneyButton() ->UIButton
    func makeBalanceLabel() -> UILabel
    
    func setConstraints(view: UIView)
    //---
}

class MoneyViewModel: MoneyViewModelProtocol{
    
    var updateViewData: ((BalanceState) -> ())?
    var currentViewData: BalanceState.BalanceData
    
    init() {
        currentViewData = BalanceState.BalanceData(money: 0)
    }
    
    func increaseMoney() {
        _increaseMoney()
    }
    
    func decreaseMoney() {
        _decreaseeMoney()
    }
    
    func updateState(){
        DispatchQueue.main.async {[weak self] in
            guard let data = self?.currentViewData else { return }
            self?.updateViewData?(.updated(data))
        }
    }
    //MARK: SRP disturbance
    
    var addIncreaseButton: UIButton!
    var addDecreaseButton: UIButton!
    var balanceLabel: UILabel!
    
    @objc func _increaseMoney(){
        currentViewData.money += 1
        updateState()
    }
    
    @objc func _decreaseeMoney(){
        currentViewData.money -= 1
        updateState()
    }
    
    func makeIncreaseMoneyButton() -> UIButton {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(_increaseMoney), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func makeDecreaseMoneyButton()  -> UIButton {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.backgroundColor = .systemPink
        button.addTarget(self, action: #selector(_decreaseeMoney), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func makeBalanceLabel() -> UILabel {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func setConstraints(view: UIView){
        let elementHeight = view.frame.width * 0.2
        let verticalPadding: CGFloat = 100
        let horizontalPadding: CGFloat = 50

        NSLayoutConstraint.activate([
            addIncreaseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: verticalPadding),
            addIncreaseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalPadding),
            addIncreaseButton.heightAnchor.constraint(equalToConstant: elementHeight),
            addIncreaseButton.widthAnchor.constraint(equalToConstant: elementHeight),
            
            addDecreaseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: verticalPadding),
            addDecreaseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalPadding),
            addDecreaseButton.heightAnchor.constraint(equalToConstant: elementHeight),
            addDecreaseButton.widthAnchor.constraint(equalToConstant: elementHeight),
            
            balanceLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -verticalPadding),
            balanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:elementHeight),
            balanceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -elementHeight),
            balanceLabel.heightAnchor.constraint(equalToConstant: elementHeight),
            
        ])
    }
}
