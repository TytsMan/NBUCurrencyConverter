//
//  NetworkError.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 20.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import Foundation

public enum NetworkError : String, Error {
    case missingURL = "URL is missing."
    case encodiongFailed = "Parameter encoding failed."
    case parametersIsMissing = "Parameters were missing."
}
