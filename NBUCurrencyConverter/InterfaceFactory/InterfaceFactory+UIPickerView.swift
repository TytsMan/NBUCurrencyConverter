//
//  InterfaceFactory+UIPickerView.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 09.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import UIKit.UIPickerView

extension InterfaceFactory {
    
    struct PickerView: InterfaceFactoryFunction {
        
        enum PickerViewType {
            case `defalut`(delegate: UIPickerViewDelegate?, dataSource: UIPickerViewDataSource?)
        }
        
        typealias InputType = PickerViewType
        typealias ResultType = UIPickerView
        
        static func make(fromType type: InputType) -> ResultType {
            let pickerView = ResultType()
            
            switch type {
            case let .defalut(delegate, dataSource):
                
                pickerView.delegate = delegate
                pickerView.dataSource = dataSource

            }
            
            return pickerView
        }
        
    }
    
}
