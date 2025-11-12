//
//  BannerCell.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/12/25.
//
import UIKit
import SnapKit

final class BannerCell : UICollectionViewCell {
    
    static let identifier: String = "BannerCell"
    
    let BmartButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Bmart"), for: .normal)
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
        self.addSubviews(addLabel, BmartButton)
        
        BmartButton.snp.makeConstraints{
            $0.top.equalTo(contentView.safeAreaLayoutGuide).offset(24)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(16)
        }
        
        addLabel.snp.makeConstraints{
            $0.top.equalTo(BmartButton.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(16)
        }
    }
    
 }

#Preview{
    BannerCell()
}
