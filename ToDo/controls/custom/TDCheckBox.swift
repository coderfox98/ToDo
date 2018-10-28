//
//  TDCheckBox.swift
//  ToDo
//
//  Created by Rish on 01/07/18.
//  Copyright © 2018 Rishabh Raj. All rights reserved.
//

import UIKit

class TDCheckBox : UIButton {
    
    var toggled : Bool? {
        didSet {
            if let toggled = toggled {
                UIView.animate(withDuration: 0.2) {
                    if toggled {
                        self.backgroundColor = .green
                        self.setImage(UIImage(named: "done-icon"), for: .normal)
                    }
                    else {
                        self.backgroundColor = .clear
                        self.setImage(UIImage(), for: .normal)
                    }
                }
            }
        }
    }
    
    @objc func toggleStatus() {
        if let status = toggled {
             toggled = !status
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.grayZero.cgColor
        
        addTarget(self, action: #selector(self.toggleStatus), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
