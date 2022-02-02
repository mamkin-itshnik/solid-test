//
//  ViewBuilder.swift
//  solid-test
//
//  Created by Евгений on 02.02.2022.
//

import UIKit

extension ViewController{
    func makeIncreaseMoneyButton() -> UIButton {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(increaseMoney), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func makeDecreaseMoneyButton()  -> UIButton {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.backgroundColor = .systemPink
        button.addTarget(self, action: #selector(decreaseeMoney), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func makeBalanceLabel() -> UILabel {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func setConstraints(){
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
