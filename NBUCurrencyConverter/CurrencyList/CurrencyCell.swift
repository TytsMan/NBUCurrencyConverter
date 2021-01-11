//
//  CurrencyCell.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 08.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import UIKit

final class CurrencyCell: UITableViewCell, ReusableView {
    
    private lazy var currencyNameLabel: UILabel = InterfaceFactory.Label.make(fromType: .defalut)
    private lazy var currencyDecriptionLabel: UILabel = InterfaceFactory.Label.make(fromType: .footnote)
    private lazy var coffLabel: UILabel = InterfaceFactory.Label.make(fromType: .rightAlignment)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        composeCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with currency: Currency) -> Void {
        
        currencyNameLabel.text = "\(currency.name)"//" (\(currency.description))"
        currencyDecriptionLabel.text = currency.description
        coffLabel.text = String(currency.rate)
        
    }
    
    override func prepareForReuse() {
        
        currencyNameLabel.text = ""
        currencyDecriptionLabel.text = ""
        coffLabel.text = ""
        
    }
    
    func composeCell() -> Void {
        
        let margin = contentView
        
        contentView.addSubview(currencyNameLabel, constraints: [
            currencyNameLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: Constants.UI.kInsets.left),
            currencyNameLabel.topAnchor.constraint(equalTo: margin.topAnchor, constant: Constants.UI.kInsets.top)
        ])
        
        
        contentView.addSubview(currencyDecriptionLabel, constraints: [
            currencyNameLabel.bottomAnchor.constraint(equalTo: currencyDecriptionLabel.topAnchor),
            currencyDecriptionLabel.topAnchor.constraint(equalTo: currencyNameLabel.bottomAnchor),
            currencyDecriptionLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: Constants.UI.kInsets.left),
            currencyDecriptionLabel.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -Constants.UI.kInsets.bottom)
        ])
        
        addSubview(coffLabel, constraints: [
            currencyNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: coffLabel.leadingAnchor),
            coffLabel.leadingAnchor.constraint(greaterThanOrEqualTo: currencyNameLabel.trailingAnchor),
            currencyDecriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: coffLabel.leadingAnchor),
            coffLabel.trailingAnchor.constraint(equalTo: margin.trailingAnchor, constant: -Constants.UI.kInsets.right),
            coffLabel.topAnchor.constraint(equalTo: margin.topAnchor, constant: Constants.UI.kInsets.top),
            coffLabel.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -Constants.UI.kInsets.bottom)
        ])
        
    }
    
}
