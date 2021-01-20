//
//  CurrencyListViewController.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 07.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import UIKit

final class CurrencyListViewController: UIViewController {

    private enum CurrencyListActionType {
        case currencyPicked(currency: Currency)
        case convertButtonTouched
    }
    
    var networkManager: NetworkManager!
    
    private var list: [Currency] = []

    private lazy var converterButton = InterfaceFactory.Button.make(
        fromType: .defalut(title: Constants.UI.CurrencyList.ExchangeButton.kTitle,
                           height: Constants.UI.kElementHeight))
    private lazy var currenciesTableView = InterfaceFactory.TableView.make(
        fromType: .defalut(delegate: self, dataSource: self))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        composeView()
        configure(networkManager: NetworkManager())
    }
    
    // MARK: - Private functions
    
    func configure(networkManager: NetworkManager) -> Void {
        self.networkManager = networkManager
        
        networkManager.getCurrentCourses { [weak self] (currenciesTDO, error) in
            
            if let error = error {
                if let error = error as? NetworkResponse {
                    print(error.rawValue)
                } else {
                    print(error.localizedDescription)
                }
            }
            
            if let currenciesTDO = currenciesTDO {
                
                let currencies = currenciesTDO
                    .compactMap { $0.toModel() }
                    .sorted()
                
                self?.list = currencies
                
                DispatchQueue.main.async {
                    self?.currenciesTableView.reloadData()
                }
                
            }
            
        }
    }
    
    private func composeView() -> Void {
        
        title = Constants.UI.CurrencyList.kTitle
        view.backgroundColor = Constants.UI.CurrencyList.kBackgroundColor
        
        currenciesTableView.register(CurrencyCell.self)
        converterButton.addTarget(self, action: #selector(convertButtonTouched), for: .touchUpInside)
        
        view.addSubview(converterButton, constraints: [
            converterButton.heightAnchor.constraint(equalToConstant: Constants.UI.kElementHeight),
            converterButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.UI.kSafeAreaPortrait.bottom),
            converterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.UI.kSafeAreaPortrait.left),
            converterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.UI.kSafeAreaPortrait.right)])
        
        view.addSubview(currenciesTableView, constraints: [
            currenciesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            currenciesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            currenciesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            currenciesTableView.bottomAnchor.constraint(equalTo: converterButton.topAnchor, constant: -Constants.UI.kInsets.top)])
        
    }
    
    @objc private func convertButtonTouched(sender: UIButton) -> Void {
        updateView(action: .convertButtonTouched)
    }
    
    private func updateView(action: CurrencyListActionType) -> Void {
        
        switch action {
        case .convertButtonTouched:
            let converter = ConverterViewController()
            converter.configure(currencies: list, pickedCurrency: list.first!)
            self.navigationController?.pushViewController(converter, animated: true)
            
        case .currencyPicked(let currency):
            let converter = ConverterViewController()
            converter.configure(currencies: list, pickedCurrency: currency)
            self.navigationController?.pushViewController(converter, animated: true)
        }
        
    }

}

// MARK: UITableViewDelegate

extension CurrencyListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        updateView(action: .currencyPicked(currency: list[indexPath.row]))
    }
    
}


// MARK: UITableViewDataSource

extension CurrencyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeue(CurrencyCell.self, for: indexPath)
        cell.configure(with: list[indexPath.row])
        return cell
        
    }

}
