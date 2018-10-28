//
//  TDListCell.swift
//  ToDo
//
//  Created by Rish on 29/06/18.
//  Copyright © 2018 Rishabh Raj. All rights reserved.
//

import UIKit

class TDListCell : UITableViewCell {
    
//    let titleLabel = TDLabel(color: .grayZero, size: 16)

    let textField = TDTextField(placeholder: "To Do", cornerRadius: 0, inset: 14)
    let view : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    let box = TDCheckBox()
    
    var toDo : ToDo? {
        didSet {
            if let toDo = toDo {
            box.toggled = toDo.status
            textField.text = toDo.title
        }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        backgroundColor = .clear 
        view.backgroundColor = .white
        
        addSubview(view)
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor, constant: 3).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        
        addSubview(textField)
        textField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
        textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(box)
        box.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
        box.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        box.heightAnchor.constraint(equalToConstant: 22).isActive = true
        box.widthAnchor.constraint(equalTo: box.heightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
