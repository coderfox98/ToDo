//
//  ListController.swift
//  ToDo
//
//  Created by Rishabh Raj on 14/06/18.
//  Copyright © 2018 Rishabh Raj. All rights reserved.
//

import UIKit

class ListController : UIViewController, TDHeaderDelegate, TDNewItemDelegate {
    
    
    func openAddItemPopup() {
        print("trying to open add item popup view")
    }
    
    func addItemToList(text:String) {
        print("text in field is : \(text)")
    }
    
    let header = TDHeaderView(title: "Stuff to get done", subtitle: "400 left")
    let popup = TDNewItemPopup()
    
    let CELL_ID = "cellid"
    
    var listData : [ToDo] = [ToDo]()
    
     let tbInset : CGFloat = 16
    
    lazy var bg : UIView = {
        let view = TDGradient()
        view.backgroundColor = .cyan
        view.layer.cornerRadius = tbInset
        
        return view
    }()
    
    let listTable = TDTableView()
    
    var keyboardHeight : CGFloat = 333
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let keyboardSize = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
         self.keyboardHeight = keyboardSize.height
        
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listData = [
            ToDo(id: 0, title: "First item", status: false ),
            ToDo(id: 1, title: "hey", status: true),
            ToDo(id: 2, title: "awesome", status: false )
        ]
        
        view.backgroundColor = .white
       
        
        view.addSubview(header)
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        view.addSubview(bg)
        bg.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        bg.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20).isActive = true
        bg.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        bg.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        view.addSubview(listTable)
        listTable.leftAnchor.constraint(equalTo: bg.leftAnchor, constant: tbInset).isActive = true
        listTable.topAnchor.constraint(equalTo: bg.topAnchor, constant: tbInset).isActive = true
        listTable.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -tbInset).isActive = true
        listTable.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: -tbInset).isActive = true
        
        view.addSubview(popup)
        popup.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        popup.leftAnchor.constraint(equalTo: view.leftAnchor, constant : 20).isActive = true
        popup.rightAnchor.constraint(equalTo: view.rightAnchor, constant : -20).isActive = true
        popup.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        popup.textField.delegate = self
        popup.delegate = self
        header.delegate = self
        listTable.delegate = self
        listTable.dataSource = self
        listTable.register(TDListCell.self, forCellReuseIdentifier: CELL_ID)
    }
}


extension ListController : UITextFieldDelegate {
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        popup.animateView(transform: CGAffineTransform(translationX: 0, y: -self.keyboardHeight), duration: 0.5)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        popup.animateView(transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.6)
    }
    
}

extension ListController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "To Do"
        }
        return "Done"
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let titleForHeader = TDLabel(color: .white, size: 20, frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
        if section == 0 {
            titleForHeader.text = "To Do"
        }
        else {
            titleForHeader.text = "Done"
        }
        return titleForHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 38
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        self.listData.forEach { (toDo) in
            if section == 0 && !toDo.status {
                count+=1
            }else if (section == 1 && toDo.status){
                count+=1
            }
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! TDListCell
      
        var itemsForSection:[ToDo] = []
        self.listData.forEach { (toDo) in
            if indexPath.section == 0 && !toDo.status {
                itemsForSection.append(toDo)
            }else if (indexPath.section == 1 && toDo.status){
                itemsForSection.append(toDo)
            }
        }
        
        cell.toDo = itemsForSection[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }
}
