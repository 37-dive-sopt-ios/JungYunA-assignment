//
//  DiscountFooterView.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/14/25.
//
import UIKit
import SnapKit

class DiscountFooterView: UICollectionReusableView {
    
    
    private var moreButton: UIButton = {
        let button = UIButton()
        button.setTitle("할인하는 가게 더보기 >", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 14)
        button.layer.borderColor = UIColor(named: "baemin_gray_200")?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout(){
        addSubview(moreButton)
        
        moreButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.width.equalTo(152)
            $0.horizontalEdges.equalToSuperview().inset(112)
        }
        
    }
    
    func setUI(){
        self.backgroundColor = .white
    }
    
    
}
