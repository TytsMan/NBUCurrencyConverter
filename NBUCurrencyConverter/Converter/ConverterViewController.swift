//
//  ConverterViewController.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 09.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import UIKit

final class ConverterViewController: UIViewController {
    
    private typealias generalData = (moneyfirstCurrency: Double, moneySecondCurrency: Double)
    
    private enum ConverterViewActionType {
        case newFirstCurrency(value: Currency)
        case newSecondCurrency(value: Currency)
        case newFirstMoney(value: Double)
        case newSecondMoney(value: Double)
    }
    
    private lazy var firstCurrencyLabel = InterfaceFactory.Label.make(fromType: .title)
    private lazy var firstMoneyTextView = InterfaceFactory.TextView.make(fromType: .numeric)
    private lazy var firstPickerView = InterfaceFactory.PickerView.make(fromType: .defalut(delegate: self, dataSource: self))
    private lazy var secondCurrencyLabel = InterfaceFactory.Label.make(fromType: .title)
    private lazy var secondMoneyTextView = InterfaceFactory.TextView.make(fromType: .numeric)
    private lazy var secondPickerView = InterfaceFactory.PickerView.make(fromType: .defalut(delegate: self, dataSource: self))
    
    // more than hard to name properties of the class
    var currencies: [Currency]!
    private var firstCurreny: Currency! {
        didSet {
            firstCurrencyLabel.text = firstCurreny.name
        }
    }
    private var secondCurreny: Currency! {
        didSet {
            secondCurrencyLabel.text = secondCurreny.name
        }
    }
    private var converdedMoney: generalData = (1,1) {
        didSet {
            converdedMoney = (converdedMoney.moneyfirstCurrency.roundToDecimal(2),
                              converdedMoney.moneySecondCurrency.roundToDecimal(2))
            
            firstMoneyTextView.text = "\(converdedMoney.moneyfirstCurrency)"
            secondMoneyTextView.text = "\(converdedMoney.moneySecondCurrency)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        compose()
        
    }
    
    func configure(currencies: [Currency], pickedCurrency: Currency) -> Void {
        
        let uah = Constants.UI.Converter.kOriginCurrency
        
        self.currencies = currencies
        self.currencies.append(uah)
        self.currencies.sort { (frs, scd) -> Bool in
            frs.name < scd.name
        }
        
        firstCurreny = uah
        if let firstCurrencyIndex = currencies.firstIndex(where: { (val) -> Bool in
            return val.name == uah.name
        }) {print(firstCurrencyIndex)
            firstPickerView.selectRow(firstCurrencyIndex, inComponent: 0, animated: false)
        }

        secondCurreny = pickedCurrency
        if let secondCurrencyIndex = currencies.firstIndex(where: { (val) -> Bool in
            return val.name == pickedCurrency.name
        }) {print(secondCurrencyIndex)
            secondPickerView.selectRow(secondCurrencyIndex, inComponent: 0, animated: false)
        }
        
        updateView(action: .newSecondMoney(value: 1.0))
        
    }
    
    // MARK: - Private functions
    private func compose() -> Void {
        
        title = Constants.UI.Converter.kTitle
        view.backgroundColor = Constants.UI.Converter.kBackgroundColor
        firstMoneyTextView.delegate = self
        secondMoneyTextView.delegate = self
        firstMoneyTextView.tag = Constants.UI.Converter.kFirstTextViewTag
        secondMoneyTextView.tag = Constants.UI.Converter.kSecondTextViewTag
        firstPickerView.tag = Constants.UI.Converter.kFirstPickerViewTag
        secondPickerView.tag = Constants.UI.Converter.kSecondPickerViewTag
        
        let margin = view.safeAreaLayoutGuide
        
        view.addSubview(firstMoneyTextView, constraints: [
            firstMoneyTextView.topAnchor.constraint(equalTo: margin.topAnchor, constant: Constants.UI.kInsets.top),
            firstMoneyTextView.trailingAnchor.constraint(equalTo: margin.trailingAnchor, constant: -Constants.UI.kInsets.right)
            ,firstMoneyTextView.heightAnchor.constraint(equalToConstant: Constants.UI.kElementHeight)
            ,firstMoneyTextView.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.UI.kTextViewWidth)
        ])

        view.addSubview(firstCurrencyLabel,constraints: [
            firstCurrencyLabel.topAnchor.constraint(equalTo: margin.topAnchor, constant: Constants.UI.kInsets.top),
            firstCurrencyLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: Constants.UI.kInsets.right),
            firstCurrencyLabel.trailingAnchor.constraint(lessThanOrEqualTo: margin.trailingAnchor, constant: -Constants.UI.kInsets.right)
            ,firstCurrencyLabel.heightAnchor.constraint(equalToConstant: Constants.UI.kElementHeight)
        ])
        
        view.addSubview(firstPickerView, constraints: [
            firstPickerView.topAnchor.constraint(equalTo: firstCurrencyLabel.bottomAnchor, constant: Constants.UI.kInsets.top),
            firstPickerView.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            firstPickerView.trailingAnchor.constraint(equalTo: margin.trailingAnchor),
            firstPickerView.heightAnchor.constraint(equalToConstant: Constants.UI.kPickerViewHeight)
        ])
        
        view.addSubview(secondMoneyTextView, constraints: [
            secondMoneyTextView.topAnchor.constraint(equalTo: firstPickerView.bottomAnchor, constant: Constants.UI.kInsets.top),
            secondMoneyTextView.trailingAnchor.constraint(equalTo: margin.trailingAnchor, constant: -Constants.UI.kInsets.right),
            secondMoneyTextView.heightAnchor.constraint(equalToConstant: Constants.UI.kElementHeight),
            secondMoneyTextView.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.UI.kTextViewWidth)
        ])
        
        view.addSubview(secondCurrencyLabel,constraints: [
            secondCurrencyLabel.topAnchor.constraint(equalTo: firstPickerView.bottomAnchor, constant: Constants.UI.kInsets.top),
            secondCurrencyLabel.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: Constants.UI.kInsets.right),
            secondCurrencyLabel.trailingAnchor.constraint(lessThanOrEqualTo: margin.trailingAnchor, constant: -Constants.UI.kInsets.right),
            secondCurrencyLabel.heightAnchor.constraint(equalToConstant: Constants.UI.kElementHeight)
        ])
        
        view.addSubview(secondPickerView, constraints: [
            secondPickerView.topAnchor.constraint(equalTo: secondCurrencyLabel.bottomAnchor),
            secondPickerView.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            secondPickerView.trailingAnchor.constraint(equalTo: margin.trailingAnchor),
            secondPickerView.heightAnchor.constraint(equalToConstant: Constants.UI.kPickerViewHeight),
            
        ])
        
    }

    private func updateView(action: ConverterViewActionType) -> Void {
        
        switch action {
            
        case .newFirstCurrency(let newCurreny):
            
            firstCurreny = newCurreny
            let convertedMoney = converdedMoney.moneyfirstCurrency / firstCurreny.rate * secondCurreny.rate
            converdedMoney = (converdedMoney.moneyfirstCurrency, convertedMoney)
            
        case .newSecondCurrency(let newCurreny):
            
            secondCurreny = newCurreny
            let convertedMoney = converdedMoney.moneyfirstCurrency / firstCurreny.rate * secondCurreny.rate
            converdedMoney = (convertedMoney, converdedMoney.moneySecondCurrency)
            
        case .newFirstMoney(let newMoney):
            
            let convertedMoney = newMoney * firstCurreny.rate / secondCurreny.rate
            converdedMoney = (newMoney, convertedMoney)
            
        case .newSecondMoney(let newMoney):
            
            let convertedMoney = newMoney * secondCurreny.rate / firstCurreny.rate
            converdedMoney = (convertedMoney, newMoney)

        }
        
    }
    
}

// MARK: UIPickerViewDelegate

extension ConverterViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag {
        case Constants.UI.Converter.kFirstPickerViewTag:
            updateView(action: .newFirstCurrency(value: currencies[row]))
            
        case Constants.UI.Converter.kSecondPickerViewTag:
            updateView(action: .newSecondCurrency(value: currencies[row]))
            
        default:
            break
        }
        
    }
    
}

// MARK: UIPickerViewDataSource

extension ConverterViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies[row].name
    }
    
}

// MARK: UITextField

extension ConverterViewController: UITextViewDelegate {
    
    /// prevent to paste text in text view
    override func canPerformAction( _ action: Selector, withSender sender: Any?) -> Bool {
        
        return super.canPerformAction(action, withSender: sender)
            && (action == #selector(UIResponderStandardEditActions.cut)
                || action == #selector(UIResponderStandardEditActions.copy))
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        guard
            let text = textView.text,
            let newMoney = Double(text) else { return }
        
        switch textView.tag {
            
        case Constants.UI.Converter.kFirstTextViewTag:
            updateView(action: .newFirstMoney(value: newMoney))
            
        case Constants.UI.Converter.kSecondTextViewTag:
            updateView(action: .newSecondMoney(value: newMoney))
            
        default:
            break
        }
        
    }

}
