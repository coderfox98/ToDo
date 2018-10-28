//
//  TDTableView.swift
//  ToDo
//
//  Created by Rish on 29/06/18.
//  Copyright © 2018 Rishabh Raj. All rights reserved.
//

import UIKit

class TDTableView : UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        checkIfAutoLayout()
        backgroundColor = .clear
        separatorStyle = .none 
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
