//
//  CurrencyListViewController.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 07.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import UIKit

class CurrencyListViewController: UIViewController {

    private lazy var converterButton = InterfaceFactory.Button.make(fromType: .defalut(title: Constants.UI.CurrencyList.ExchangeButton.kTitle, height: Constants.UI.CurrencyList.ExchangeButton.height))
    private lazy var currenciesTableView = InterfaceFactory.TableView.make(fromType: .defalut(delegate: self, dataSource: self))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Constants.UI.CurrencyList.kTitle
        
        configure()
    }
    
    // MARK: - Setup view
    func configure() -> Void {
        
        view.backgroundColor = Constants.UI.CurrencyList.kBackgroundColor
        
        currenciesTableView.register(CurrencyCell.self)
        
        view.addSubview(converterButton, constraints: [
            converterButton.heightAnchor.constraint(equalToConstant: Constants.UI.CurrencyList.ExchangeButton.height),
            converterButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.UI.safeAreaPortrait.bottom),
            converterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.UI.safeAreaPortrait.left),
            converterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.UI.safeAreaPortrait.right)])
        
        view.addSubview(currenciesTableView, constraints: [
            currenciesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            currenciesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            currenciesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            currenciesTableView.bottomAnchor.constraint(equalTo: converterButton.topAnchor, constant: -Constants.UI.insets.top)])

        
        
    }
    
    @objc private func exchangeButtonPressed(sender: UIButton) -> Void {
        print("tapped")
    }

}

// MARK: UITableViewDelegate

extension CurrencyListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("open converter scren now")
    }
    
}


// MARK: UITableViewDataSource

extension CurrencyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(CurrencyCell.self, for: indexPath)
        cell.configure(with: "heh", coff: "hah")
        return cell
        
    }


}
