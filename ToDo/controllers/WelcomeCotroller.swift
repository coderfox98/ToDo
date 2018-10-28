//
//  WelcomeCotroller.swift
//  ToDo
//
//  Created by Rishabh Raj on 07/06/18.
//  Copyright © 2018 Rishabh Raj. All rights reserved.
//

import UIKit

class WelcomeCotroller: UIViewController {
    
    let bg : UIView = {
        let view = TDGradient()
        view.backgroundColor = .cyan
        view.layer.cornerRadius = 24
       
        return view
    }()
    
    let titleLabel = TDLabel(title: "GET IT DONE", size: 24, textAlign : .center)
    let infoLabel = TDLabel(title: "WELCOME . GET IT DONE IS A TO DO LIST.\nA REALLY AWESOME TO DO LIST", size: 14, textAlign: .center)
    
    let copyrightLabel = TDLabel(title: "© 2018 | coderfox98", color: .grayOne, size: 14, textAlign: .center)
    
    let nextButton = TDButton(title: "START WINNING", type: .roundedText)
        
    @objc func handleNext() {
        
        
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.nextButton.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }) { (_) in
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                
            }) { (_) in
                self.present(ListController(), animated: true, completion: nil)
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        nextButton.addTarget(self, action: #selector(self.handleNext), for: [UIControl.Event.touchUpInside, UIControl.Event.touchUpOutside])
        
        view.addSubview(bg)
        bg.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        bg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        bg.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        bg.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        bg.addSubview(titleLabel)
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: bg.safeAreaLayoutGuide.topAnchor,constant: 40).isActive = true
        
        bg.addSubview(infoLabel)
         infoLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        infoLabel.centerYAnchor.constraint(equalTo: bg.centerYAnchor).isActive = true
        infoLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        infoLabel.numberOfLines = 2
        
        bg.addSubview(nextButton)
        nextButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -140).isActive = true
        
        view.addSubview(copyrightLabel)
        copyrightLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        copyrightLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        copyrightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        copyrightLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }

    
   
}

