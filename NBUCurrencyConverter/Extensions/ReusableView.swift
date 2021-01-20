//
//  ReusableView.swift
//  Utilities
//
//  Created by Ivan Dekhtiarov on 08.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import UIKit

// MARK: - ReusableView

/// A reusableView is identified by a `reuseIdentifier`.
public protocol ReusableView: AnyObject {
    /// Identifies a `ReusableView`. The default implementation returns the name of the class as the `reuseIdentifier`.
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

// MARK: - UITableView

public extension UITableView {
    
    /// Register a class for use in creating new table view cells.
    ///
    /// - Parameter cell: The type of class which should be registered.
    func register<Cell>(_ cell: Cell.Type) where Cell: ReusableView & UITableViewCell {
        self.register(cell, forCellReuseIdentifier: cell.reuseIdentifier)
    }
    
    /// Registers a class for use in creating header/footer views for the table view.
    ///
    /// - Parameters:
    ///   - view: The class to use for the header/footer view.
    func register<HeaderFooter>(_ headerFooter: HeaderFooter.Type) where HeaderFooter: ReusableView & UITableViewHeaderFooterView {
        self.register(headerFooter.self, forHeaderFooterViewReuseIdentifier: headerFooter.reuseIdentifier)
    }
    
    /// Returns a reusable cell object located by its identifier.
    ///
    /// - Parameters:
    ///   - cell: The type of class of the cell.
    ///   - indexPath: The index path specifying the location of the cell.
    /// - Returns: A valid table view cell of the given type.
    func dequeue<Cell>(_ cell: Cell.Type, for indexPath: IndexPath) -> Cell where Cell: ReusableView & UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: cell.reuseIdentifier, for: indexPath) as? Cell else {
            fatalError("Could not dequeue reusable cell with identifier: \(Cell.reuseIdentifier)")
        }
        return cell
    }
    
    /// Returns a reusable header/footer view located by its identifier.
    ///
    /// - Parameter headerFooter: The class of the header/footer view.
    /// - Returns: A valid table view header footer view of the given type.
    func dequeue<HeaderFooter>(_ headerFooter: HeaderFooter.Type) -> HeaderFooter where HeaderFooter: ReusableView & UITableViewHeaderFooterView {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: headerFooter.reuseIdentifier) as? HeaderFooter else {
            fatalError("Could not dequeue reusable header footer view with identifier: \(headerFooter.reuseIdentifier)")
        }
        return view
    }
}
