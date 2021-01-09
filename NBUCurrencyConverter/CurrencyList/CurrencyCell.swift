//
//  CurrencyCell.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 08.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell, ReusableView {
    
    private lazy var currencyLabel: UILabel = InterfaceFactory.Label.make(fromType: .leftAlignment)
    private lazy var coffLabel: UILabel = InterfaceFactory.Label.make(fromType: .rightAlignment)
    
    func configure(with currency: String, coff: String) -> Void {
        
        currencyLabel.text = currency
        coffLabel.text = coff
        
        contentView.addSubview(currencyLabel, constraints: [
            currencyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.UI.insets.left),
            currencyLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.UI.insets.top),
            currencyLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.UI.insets.bottom)
        ])
        
        addSubview(coffLabel, constraints: [
            currencyLabel.trailingAnchor.constraint(lessThanOrEqualTo: coffLabel.leadingAnchor),
            coffLabel.leadingAnchor.constraint(greaterThanOrEqualTo: currencyLabel.trailingAnchor),
            
            coffLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.UI.insets.right),
            coffLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.UI.insets.top),
            coffLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.UI.insets.bottom)
        ])
        
    }
    
}
