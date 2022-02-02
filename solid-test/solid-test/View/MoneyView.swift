//
//  ViewController.swift
//  solid-test
//
//  Created by Евгений on 02.02.2022.
//

import UIKit

class ViewController: UIViewController {

    private var viewModel: MoneyViewModelProtocol!
    
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
        
        //MARK:  broke SRP
        viewModel.addIncreaseButton = viewModel.makeIncreaseMoneyButton()
        viewModel.addDecreaseButton = viewModel.makeDecreaseMoneyButton()
        viewModel.balanceLabel = viewModel.makeBalanceLabel()
        
        view.addSubview(viewModel.addIncreaseButton)
        view.addSubview(viewModel.addDecreaseButton)
        view.addSubview(viewModel.balanceLabel)
        viewModel.setConstraints(view: self.view)
        //---
        
        connectDataSource()
    }
    
    func connectDataSource(){
        viewModel.updateViewData = { [weak self] state in
            self?.viewData = state
        }
    }
    
    func showBalance(str: String){
        //MARK:  broke SRP
        viewModel.balanceLabel.text = str
        //---
    }
    
}

