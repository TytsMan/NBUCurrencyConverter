//
//  InterfaceFactory+UILabel.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 08.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import UIKit.UILabel

extension InterfaceFactory {
    
    struct Label: InterfaceFactoryFunction {
        
        enum LabelType {
            case `defalut`
            case footnote
            case title
            case leftAlignment
            case rightAlignment
        }
        
        typealias InputType = LabelType
        typealias ResultType = UILabel
        
        static func make(fromType type: InputType) -> ResultType {
            let label = ResultType()
            
            switch type {
            case .defalut:
                
                label.font = .preferredFont(forTextStyle: .body)
                label.textColor = Constants.UI.CurrencyList.CurrencyCell.kTextColor
                label.textAlignment = .center
            
            case .footnote:
                
                label.font = .preferredFont(forTextStyle: .footnote)
                label.textColor = Constants.UI.CurrencyList.CurrencyCell.kTextColor
                label.textAlignment = .center
                label.textColor = .gray
                
            case .title:
                
                label.font = .preferredFont(forTextStyle: .title1)
                label.textColor = Constants.UI.CurrencyList.CurrencyCell.kTextColor
                label.textAlignment = .right
                
            case .leftAlignment:
                
                label.font = .preferredFont(forTextStyle: .title1)
                label.textColor = Constants.UI.CurrencyList.CurrencyCell.kTextColor
                label.textAlignment = .left
                
            case .rightAlignment:
                
                label.font = .preferredFont(forTextStyle: .title1)
                label.textColor = Constants.UI.CurrencyList.CurrencyCell.kTextColor
                label.textAlignment = .right
                
            }
            
            return label
        }
        
    }
    
}
