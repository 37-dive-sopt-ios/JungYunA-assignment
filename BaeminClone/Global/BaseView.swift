//
//  BaseView.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/11/25.
//

import UIKit

import SnapKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        

    func setUI() {}
    

    func setLayout() {}
}
