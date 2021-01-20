//
//  Currency.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 09.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import Foundation

struct Currency {
    
    let name: String
    let description: String
    let rate: Double
    let date: Date
    
}

extension Currency: Comparable {
    static func < (lhs: Currency, rhs: Currency) -> Bool {
        return lhs.name < rhs.name
    }
}
