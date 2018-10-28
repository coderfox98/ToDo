//
//  extension.swift
//  ToDo
//
//  Created by Rishabh Raj on 13/06/18.
//  Copyright © 2018 Rishabh Raj. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var blueZero : UIColor { return UIColor.init(rgb: 0x64E4FF) }
    static var blueOne : UIColor { return UIColor.init(rgb: 0x3A7BD5) }
    static var grayZero : UIColor { return UIColor.init(rgb: 0x9B9B9B)}
     static var grayOne : UIColor { return UIColor.init(rgb: 0x424242)}
    
    convenience init(red: Int, green: Int, blue: Int) {
 // convenience init are used where we need to pass lesser values than the one procided in the extension Class. Like here we didn't want to pass in the alpha value everytime
        self.init(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1)
        
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
}

extension UIView {
    func checkIfAutoLayout() {
         if frame == .zero
         {
            translatesAutoresizingMaskIntoConstraints = false }
    }
    
    func animateView(transform:CGAffineTransform, duration : Double) {
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 1, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.transform = transform
        }, completion: nil)
    }
}
