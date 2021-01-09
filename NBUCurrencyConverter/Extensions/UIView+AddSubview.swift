//
//  UIView+AddSubview.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 08.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult func addSubview<S: UIView>(_ subview: S, constraints: [NSLayoutConstraint]) -> S {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        NSLayoutConstraint.activate(constraints)
        return subview
    }
}
