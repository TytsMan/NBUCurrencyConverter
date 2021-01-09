//
//  HTTPTask.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 09.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//


public typealias HTTPHeaders = [String:String]

public struct HTTPTask {
    let additionalHeaders: HTTPHeaders?
    let urlParameters: Parameters?
    let bodyParameters: Parameters?
}


