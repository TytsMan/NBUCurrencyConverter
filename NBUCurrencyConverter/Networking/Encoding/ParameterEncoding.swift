//
//  ParameterEncoding.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 09.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import Foundation

public typealias Parameters = [String: Any]

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public enum NetworkError : String, Error {
    case missingURL = "URL is missing."
    case encodiongFailed = "Parameter encoding failed."
    case parametersIsMissing = "Parameters were missing."
}