//
//  RCSQuantityTextField.swift
//  shopper
//
//  Created by Ryan Spring on 3/31/17.
//  Copyright © 2017 Ryan Spring. All rights reserved.
//

import UIKit

public class RCSQuantityTextField: RCSTextField {

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    // MARK: TextField Delegate
   override public func textField(_ textField: UITextField,
                                  shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textL = textField.text else {
            return true
        }

        let newString = (textL as NSString).replacingCharacters(in: range, with: string)
        setQuantity(string:newString)

        return true
    }

    // MARK: Private Methods
    private func setQuantity(string quantityString: String) {
        if quantityString.characters.count == 0 {
            value = .quantity(0.0)
            return
        }

        let number = RCSQuantityTextField.nForm.number(from: quantityString)!
        value = .quantity(number.doubleValue)

        shadowDelegate?.fieldValueDidChange(field: self)
    }

    private func zeroQuantity() {
        text = ""
    }

    private func setup() {
        super.keyboardType = .decimalPad
        super.textAlignment = .right
        value = RCSTextFieldValue.quantity(0.0)
    }
}
