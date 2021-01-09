//
//  InterfaceFactory+UITableView.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 08.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import UIKit.UITableView

extension InterfaceFactory {
    
    struct TableView: InterfaceFactoryFunction {
        
        enum TableViewType {
            case `defalut`(delegate: UITableViewDelegate, dataSource: UITableViewDataSource)
        }
        
        typealias InputType = TableViewType
        typealias ResultType = UITableView
        
        static func make(fromType type: InputType) -> ResultType {
            let tableView = ResultType()
            
            switch type {
            case let .defalut(delegate, dataSource):

                tableView.delegate = delegate
                tableView.dataSource = dataSource
                
            }
            
            return tableView
        }
        
    }
    
}
