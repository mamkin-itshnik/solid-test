//
//  ViewController.swift
//  solid-test
//
//  Created by Евгений on 02.02.2022.
//

import UIKit

class ViewController: UIViewController {
    lazy var addIncreaseButton = makeIncreaseMoneyButton()
    lazy var addDecreaseButton = makeDecreaseMoneyButton()
    lazy var balanceLabel = makeBalanceLabel()
    private var viewModel: MoneyViewModel!
    
    var viewData: BalanceState = .checking{
        didSet{
            switch viewData{
            case .checking:
                print("____START")
                break
            case .updated(let data):
                showBalance(str: "\(data.money)")
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MoneyViewModel()
        view.addSubview(addIncreaseButton)
        view.addSubview(addDecreaseButton)
        view.addSubview(balanceLabel)
        setConstraints()
        connectDataSource()
    }
    
    func connectDataSource(){
        viewModel.updateViewData = { [weak self] state in
            self?.viewData = state
        }
    }
    
    func showBalance(str: String){
        balanceLabel.text = str
    }
    
    @objc func increaseMoney(){
        viewModel.increaseMoney()
    }
    
    @objc func decreaseeMoney(){
        viewModel.decreaseMoney()
    }
    
    
}

