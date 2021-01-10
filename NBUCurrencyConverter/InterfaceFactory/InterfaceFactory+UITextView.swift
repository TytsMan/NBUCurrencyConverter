//
//  InterfaceFactory+UITextView.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 09.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import UIKit.UITextView

extension InterfaceFactory {
    
    struct TextView: InterfaceFactoryFunction {
        
        enum TextViewType {
            case `defalut`
            case numeric
        }
        
        typealias InputType = TextViewType
        typealias ResultType = UITextView
        
        static func make(fromType type: InputType) -> ResultType {
            let textView = ResultType()
            
            switch type {
            case .defalut:
                
                textView.automaticallyAdjustsScrollIndicatorInsets = false
                textView.textAlignment = .center
                
            case .numeric:
                
                textView.automaticallyAdjustsScrollIndicatorInsets = false
                textView.textAlignment = .right
                textView.keyboardType = .numberPad
                textView.font = .preferredFont(forTextStyle: .body)
                
                textView.layer.borderWidth = 0.8
                textView.layer.cornerRadius = 4.0
                
            }
            
            return textView
        }
        
    }
    
}
