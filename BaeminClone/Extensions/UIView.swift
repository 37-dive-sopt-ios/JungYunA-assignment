//
//  UIView.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/10/25.
//
import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach{self.addSubview($0)}
    }
}
