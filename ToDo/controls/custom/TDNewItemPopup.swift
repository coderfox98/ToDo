//
//  NewItemPopup.swift
//  ToDo
//
//  Created by Rishabh Raj on 15/06/18.
//  Copyright © 2018 Rishabh Raj. All rights reserved.
//

import UIKit

class TDNewItemPopup : TDGradient {
    
    let cancel = TDButton(title: "  cancel  ", type: .roundedText, radius: 4)
    let add = TDButton(title: "  add  ", type: .roundedText, radius: 4)
    let textField = TDTextField(placeholder: "Go buy Ikea Frames", inset: 6)
    var delegate : TDNewItemDelegate?
    
    @ objc func handleCancel() {
        textField.resignFirstResponder()
    }
    
    @ objc func handleAdd() {
       
        if let delegate = self.delegate, let textFieldText = self.textField.text {
            delegate.addItemToList(text: textFieldText)
        }
    }
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        let inset : CGFloat = 12
        
        self.layer.cornerRadius = 16
        addSubview(cancel)
        cancel.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
        cancel.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
        cancel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(add)
        add.rightAnchor.constraint(equalTo: rightAnchor, constant: -inset).isActive = true
        add.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
        add.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        cancel.addTarget(self, action: #selector(self.handleCancel), for: UIControl.Event.touchUpInside)
        add.addTarget(self, action: #selector(self.handleAdd), for: UIControl.Event.touchUpInside)

        addSubview(textField)
        textField.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -inset).isActive = true
        textField.topAnchor.constraint(equalTo: add.safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
