//
//  DiscountHeaderView.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/14/25.
//

import UIKit
import SnapKit

class DiscountHeaderView: UICollectionReusableView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "무조건 할인하는 가게"
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        return label
    }()
    
    private let discountLabel: UILabel = {
        let label = UILabel()
        label.text = "2천원 이상 또는 15% 이상 할인중"
        label.textAlignment = .left
        label.textColor = .baeminGray300
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        return label
    }()
    
    private let infoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "info")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var imageStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [label, infoImage])
        stack.axis = .horizontal
        stack.spacing = 3
        stack.alignment = .center
        return stack
    }()
    
    private let discountImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "discount")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setLayout(){
        addSubview(imageStackView)
        addSubviews(discountImage,discountLabel)
        
        imageStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(16)
        }
        
        discountLabel.snp.makeConstraints {
            $0.top.equalTo(imageStackView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(14)
            $0.width.equalTo(200)
        }
        
        discountImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(23)
            $0.height.equalTo(59)
            $0.width.equalTo(66)
        }
        
        
        infoImage.snp.makeConstraints{
            $0.width.equalTo(16)
            $0.height.equalTo(16)
        }
        
    }
    
    private func setUI() {
        self.backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
