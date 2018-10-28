//
//  TDLabel.swift
//  ToDo
//
//  Created by Rishabh Raj on 13/06/18.
//  Copyright © 2018 Rishabh Raj. All rights reserved.
//

import UIKit

class TDLabel : UILabel {
    init(title: String = "default text",color: UIColor = .white,size:CGFloat = 16, frame : CGRect = .zero, textAlign: NSTextAlignment = .left) {
        super.init(frame: frame)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.text = title
        self.textColor = color
        self.font = UIFont.init(name: "Raleway-Regular", size: size)
        self.textAlignment = textAlign
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
