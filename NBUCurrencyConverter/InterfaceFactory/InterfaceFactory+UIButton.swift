//
//  InterfaceFactory+UIButton.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 08.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import UIKit.UIButton

extension InterfaceFactory {
    
    struct Button: InterfaceFactoryFunction {
        
        enum ButtonType {
            case `defalut`(title: String? = nil, height: CGFloat)
        }
        
        typealias InputType = ButtonType
        typealias ResultType = UIButton
        
        static func make(fromType type: InputType) -> ResultType {
            let button = ResultType()
            
            switch type {
            case let .defalut(title, height):
                button.layer.cornerRadius = height/2
                button.layer.backgroundColor = Constants.UI.CurrencyList.ExchangeButton.kBackgroundColor.cgColor
                
                button.setTitleColor(Constants.UI.CurrencyList.ExchangeButton.kTitleColor, for: .init())
                
                if let title = title {
                    button.setTitle(title, for: .init())
                }
                
            }
            
            return button
        }
        
    }
    
}
