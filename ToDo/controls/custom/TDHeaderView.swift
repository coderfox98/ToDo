//
//  TDHeader.swift
//  ToDo
//
//  Created by Rishabh Raj on 14/06/18.
//  Copyright © 2018 Rishabh Raj. All rights reserved.
//

import UIKit

class TDHeaderView : UIView {
    
    let bg = TDGradient()
    let titleLabel = TDLabel(size: 14)
    let subtitleLabel = TDLabel(size: 24)
    let addButton = TDButton(type: .squareIcon)
    var delegate : TDHeaderDelegate?
    
    init(frame : CGRect = .zero, title:String = "header title", subtitle : String = "header subtitle") {
        super.init(frame: frame)
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        setUpLayout()
    }
    func setUpLayout() {
        addSubview(bg)
        bg.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        bg.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant : 12).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant : 20 + 8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subtitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant : 20 + 8).isActive = true
        subtitleLabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: 50).isActive = true
        
        addSubview(addButton)
        addButton.bottomAnchor.constraint(equalTo: subtitleLabel.bottomAnchor).isActive = true
        addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20 - 8).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor, multiplier: 1).isActive = true
        
        addButton.addTarget(self, action: #selector(self.handleAddButton), for: UIControl.Event.touchUpInside)
        
    }
    
    @objc func handleAddButton() {
        if let delegate = self.delegate {
            delegate.openAddItemPopup()
        }
    }
    
            required init?(coder aDecoder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            
        }
}
