//
//  File.swift
//  BaeminClone
//
//  Created by 정윤아 on 10/30/25.
//

import UIKit

extension UITextField {
    func addLeftPadding(_ width: CGFloat = 10){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func addRightPadding(_ width: CGFloat = 10){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = ViewMode.always
    }
}

