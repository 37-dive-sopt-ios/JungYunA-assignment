//
//  ShopNameCell.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/12/25.
//

import UIKit
import SnapKit

final class ShopNameCell : UICollectionViewCell {
    
    static let identifier: String = "ShopNameCell"
    
    // MARK: - UI Components
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.textColor = UIColor(named: "baemin_black")
        label.text = "치킨"
        label.textAlignment = .center
        return label
    }()
    
    let logoImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        contentView.backgroundColor = .white
    }
    
    private func setHierarchy() {
        contentView.addSubviews(nameLabel, logoImage)
    }
    
    private func setLayout() {
        
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(58)
            $0.height.equalTo(58)
            $0.horizontalEdges.equalToSuperview().inset(2)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(logoImage.snp.bottom).offset(6)
            $0.width.equalTo(58)
            
        }
    }
    
    func configure(with shop: Shop) {
        nameLabel.text = shop.logoName
        logoImage.image = UIImage(named: shop.logoImage)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        logoImage.image = nil
    }
}

