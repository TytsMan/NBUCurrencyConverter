//
//  Constants+UI.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 07.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import Foundation
import UIKit

extension Constants {
    enum UI {}
}

extension Constants.UI {
    
    /// Dimensions
    static let kSafeAreaPortrait = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
    static let kInsets = UIEdgeInsets(top: 4, left: 4, bottom: 8, right: 8)
    
    static let kElementHeight: CGFloat = 34
    static let kTextViewWidth: CGFloat = 150
    static let kPickerViewHeight: CGFloat = 150
}

extension Constants.UI {
    
    enum CurrencyList {
        
        static let kTitle = "Currencies"
        static let kBackgroundColor: UIColor = .white
        
        enum CurrencyListTableView {
            static let kBackgroundColor: UIColor = .white
         }
        
        enum ExchangeButton{
            static let kTitle = "Exchange"
            static let kTitleColor: UIColor = .white
            static let kBackgroundColor: UIColor = .systemBlue
        }
        
        enum CurrencyCell {
            static let kTextColor:UIColor = .black
        }
        
    }
}

extension Constants.UI {
    
    enum Converter {
        static let kTitle = "Converter"
        static let kBackgroundColor: UIColor = .white
        static let kOriginCurrency = Currency(name: "UAH", description: "gruvnya", rate: 1.0, date: Date())
        
        static let kFirstTextViewTag = 1000
        static let kSecondTextViewTag = 1001
        
        static let kFirstPickerViewTag = 1002
        static let kSecondPickerViewTag = 1003

        
    }
    
}
