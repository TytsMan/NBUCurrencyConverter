//
//  InterfaceFactory.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 08.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

protocol InterfaceFactoryFunction {
    associatedtype InputType
    associatedtype ResultType
    
    static func make(fromType type: InputType) -> ResultType
}

enum InterfaceFactory {}
