//
//  HeaderCell.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/12/25.
//

import UIKit
import SnapKit

final class HeaderCell : UICollectionViewCell {
    
    static let identifier: String = "HeaderCell"
    
    
        private let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "우리집"
            label.font = UIFont(name: "Pretendard-Bold", size: 16)
            label.textAlignment = .center
            return label
        }()
    
        var downButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "down"), for: .normal)
            button.tintColor = .black
            return button
        }()
    
        var addButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "add"), for: .normal)
            return button
        }()
    
        var alarmButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "alarm"), for: .normal)
            return button
        }()
    
        var cartButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "cart"), for: .normal)
            return button
        }()
    
        let addLabel: UILabel = {
            let label = UILabel()
            label.text = "전상품 쿠폰팩 + 60%특가 >"
            label.textColor = UIColor(named: "baemin_black")
            label.font = UIFont(name: "Pretendard-Bold", size: 16)
            return label
        }()
    
    // MARK: - Initialization
    
        override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        contentView.backgroundColor = UIColor(named: "baemin_gray_200")
    }
    
    private func setLayout() {
        self.addSubviews(titleLabel, downButton,addButton,alarmButton,cartButton)
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(9)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(16)
        }
        
        downButton.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(64)
            $0.height.equalTo(5)
            $0.centerY.equalTo(titleLabel)
        }
        
        addButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(88)
            $0.height.equalTo(24)
            $0.centerY.equalTo(titleLabel)
        }
        
        alarmButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(52)
            $0.height.equalTo(24)
            $0.centerY.equalTo(titleLabel)
        }
        
        cartButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(24)
            $0.centerY.equalTo(titleLabel)
        }
    }
    
 }

#Preview{
    HeaderCell()
}
