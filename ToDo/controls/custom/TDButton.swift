//
//  TDButton.swift
//  ToDo
//
//  Created by Rishabh Raj on 14/06/18.
//  Copyright © 2018 Rishabh Raj. All rights reserved.
//

import UIKit

class TDButton : UIButton {
    
    var title: String!
    var type:ButtonOptions!
    var radius:CGFloat!
    
    init(title: String = "button text", frame : CGRect = .zero, type : ButtonOptions = .roundedText, radius: CGFloat = 20) {
        super.init(frame: frame)
        if frame == .zero {
            
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.title = title
        self.type = type
        self.radius = radius
        self.phaseTwo(type:type)
        
    }
        
        
   
    
    func phaseTwo(type: ButtonOptions) {
        self.backgroundColor = .white
        
      
        if let titleLabel = self.titleLabel {
            titleLabel.font = UIFont.init(name: "Raleway-Regular", size: 16)
            
        }
        
        switch type {
        case .roundedText:
            
            self.roundedText()
        case .squareIcon:
            self.squareIcon()
        default:
            break;
        }
    }
    
    func squareIcon() {
        self.setImage(UIImage(named: "add-icon"), for: .normal)
    }
    
    func roundedText() {
        self.setTitle(self.title, for: UIControl.State.normal)
        self.setTitleColor(.gray, for: UIControl.State.normal)
        self.layer.cornerRadius = self.radius
        //Use corner radius value as half the height
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    
}
