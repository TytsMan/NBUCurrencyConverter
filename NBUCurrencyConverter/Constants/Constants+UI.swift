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
    
    static let safeAreaPortrait = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
    static let insets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
}

extension Constants.UI {
    
    enum CurrencyList {
        
        static let kTitle = "Currencies"
        static let kBackgroundColor: UIColor = .systemBackground
        
        enum CurrencyListTableView {
            
            static let kBackgroundColor: UIColor = .systemBackground
            
         }
        
        enum ExchangeButton{
            static let kTitle = "Exchange"
            static let kTitleColor: UIColor = .white
            static let kBackgroundColor: UIColor = .systemBlue
            static let height: CGFloat = 34
        }
        
        enum CurrencyCell {
            static let kTextColor:UIColor = .black
        }
        
    }
}
