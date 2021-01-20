//
//  NBUAPI.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 09.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import Foundation

enum NBUAPI {
    case nowadaysCourses
    case coursesFor(date: Date)
}

extension NBUAPI: EndPointType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://bank.gov.ua/") else { fatalError("Coulndn't continue without valid URL!") }
        return url
    }
    
    var path: String {
        switch self {
        case .nowadaysCourses, .coursesFor(_):
            return "NBUStatService/v1/statdirectory/exchange"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        
        let headers: HTTPHeaders? = nil
        var urlParams: Parameters? = nil
        let bodyParams: Parameters? = nil
        
        switch self {
        case .coursesFor(let date):
            urlParams = ["date": date.toString(format: "yyyyMMdd")]
        default:
            break
        }
        
        if (urlParams != nil) {
            urlParams!["json"] = ""
        } else {
            urlParams = ["json": ""]
        }
        
        return HTTPTask(additionalHeaders: headers, urlParameters: urlParams, bodyParameters: bodyParams)
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}
