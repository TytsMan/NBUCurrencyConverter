//
//  CurrencyTDO.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 09.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import Foundation

typealias CurrencyArrayWrapperTDO = [CurrencyTDO]

// MARK: - WelcomeElement
struct CurrencyTDO: Codable {
    let magicIndex: Int
    let fullName: String
    let rate: Double
    let name: String
    let dateString: String
    
    enum CodingKeys: String, CodingKey {
        case magicIndex = "r030"
        case fullName = "txt"
        case rate
        case name = "cc"
        case dateString = "exchangedate"
    }
}

extension CurrencyTDO {
    
    func toModel() -> Currency? {
        
        guard let date = Date.dateFrom(string: dateString, format: "dd.MM.yyyy") else { return nil }

        return Currency(name: name.uppercased(), description: fullName, rate: rate, date: date)
        
    }
}


