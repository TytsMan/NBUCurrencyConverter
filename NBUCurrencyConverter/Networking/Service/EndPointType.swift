//
//  EndPointType.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 09.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

