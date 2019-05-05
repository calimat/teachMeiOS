//
//  ChalkBoardTextField.swift
//  teachMe
//
//  Created by Ricardo Herrera Petit on 5/5/19.
//  Copyright © 2019 Ricardo Herrera Petit. All rights reserved.
//

import UIKit

class ChalkBoardTextField: UITextField {

    override func awakeFromNib() {
         self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor:  #colorLiteral(red: 1, green: 0.9960784314, blue: 0.9764705882, alpha: 1)])
    }

}
