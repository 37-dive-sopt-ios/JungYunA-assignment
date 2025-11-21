//
// RecentCollectionHeaderView.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/13/25.
//

import UIKit
import SnapKit

class RecentCollectionHeaderView: UICollectionReusableView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "최근에 주문했어요"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Pretendard-SemiBold", size: 18)
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
    
    private let seeAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("전체보기 >", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 14)
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
    
    
    private func setLayout(){
        addSubview(imageStackView)
        addSubview(seeAllButton)
        
        imageStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        
        infoImage.snp.makeConstraints{
            $0.width.equalTo(16)
            $0.height.equalTo(16)
        }
        
        
        seeAllButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
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
