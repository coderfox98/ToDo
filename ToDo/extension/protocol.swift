//
//  protocol.swift
//  ToDo
//
//  Created by Rishabh Raj on 15/06/18.
//  Copyright © 2018 Rishabh Raj. All rights reserved.
//

import Foundation

protocol TDHeaderDelegate {
    func openAddItemPopup()
    
}

protocol TDNewItemDelegate {
    func addItemToList(text: String)
}
