//
//  RecommendStoreCell.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/13/25.
//

import UIKit
import SnapKit

final class RecommendStoreCell : UICollectionViewCell {
    
    static let identifier: String = "RecommendStoreCell"
    
    // MARK: - UI Components
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 12)
        label.textColor = UIColor(named: "baemin_gray_600")
        label.textAlignment = .left
        return label
    }()
    
    private let reviewCountLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 12)
        label.textColor = UIColor(named: "baemin_gray_600")
        label.textAlignment = .left
        return label
    }()
    
    private let reviewLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 12)
        label.textColor = UIColor(named: "baemin_gray_600")
        label.textAlignment = .left
        return label
    }()
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var reviewStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [starImageView, reviewLabel])
        stack.axis = .horizontal
        stack.spacing = 2
        stack.alignment = .leading
        return stack
    }()
    
    private let menuLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.textColor = UIColor(named: "baemin_black")
        label.textAlignment = .left
        return label
    }()
    
    
    private let discountLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Bold", size: 14)
        label.textColor = UIColor(_colorLiteralRed: 225/255, green: 28/255, blue: 48/255, alpha: 100)  //빨강
        label.textAlignment = .left
        return label
    }()
    
    private let salePriceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Bold", size: 14)
        label.textColor = UIColor(named: "baemin_black")
        label.textAlignment = .left
        return label
    }()
    
    private let originalPriceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 12)
        label.textColor = UIColor(named: "baemin_gray_600")
        label.textAlignment = .left
        return label
    }()
    
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4
        imageView.backgroundColor = UIColor(named: "baemin_gray_200")
        return imageView
    }()
    
    private let leastOrderLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Bold", size: 13)
        label.textColor = UIColor(red: 84/255, green: 21/255, blue: 255/255, alpha: 1) //파랑
        label.text = "최소주문금액없음"
        return label
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
        contentView.addSubviews(nameLabel, imageView, discountLabel, salePriceLabel, originalPriceLabel, menuLabel, reviewCountLabel, reviewStackView, leastOrderLabel)
    }
    
    private func setLayout() {
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(145)
            $0.height.equalTo(145)
            
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(9)
            $0.leading.equalToSuperview()
            $0.width.equalTo(69)
            $0.height.equalTo(12)
        }
        
        reviewStackView.snp.makeConstraints {
            $0.centerY.equalTo(nameLabel)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(5)
            $0.height.equalTo(12)
        }
        
        reviewCountLabel.snp.makeConstraints {
            $0.centerY.equalTo(nameLabel)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(39)
            $0.width.equalTo(35)
            $0.height.equalTo(12)
        }
        
        menuLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(27)
            $0.width.equalToSuperview()
            $0.height.equalTo(14)
        }
        
        discountLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(47)
            $0.leading.equalToSuperview()
            $0.height.equalTo(14)
            $0.width.equalTo(35)
        }
        
        salePriceLabel.snp.makeConstraints {
            $0.centerY.equalTo(discountLabel)
            $0.leading.equalTo(discountLabel.snp.trailing).offset(6)
            $0.height.equalTo(14)
            $0.width.equalTo(56)
        }
        
        originalPriceLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(67)
            $0.leading.equalToSuperview()
            $0.height.equalTo(12)
            $0.width.equalTo(94)
        }
        
        leastOrderLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(85)
            $0.leading.equalToSuperview()
            $0.height.equalTo(13)
            $0.width.equalTo(145)
        }
        
        
        
    }
    
    func configure(with store: Store) {
        nameLabel.text = store.store
        menuLabel.text = store.menu
        discountLabel.text = "\(store.discountRate)%"
        salePriceLabel.text = "\(store.salePrice)원"
        reviewCountLabel.text = "(\(store.reviewCount))"
        reviewLabel.text = "\(store.review)"
        imageView.image = UIImage(named: store.storeImage)
        
        // 원래 가격 취소선
        let text = "\(store.originalPrice)원"
        let attr = NSMutableAttributedString(string: text)
        attr.addAttributes([
            .strikethroughStyle: NSUnderlineStyle.single.rawValue,
            .strikethroughColor: UIColor(named: "baemin_gray_600") ?? .lightGray
        ], range: NSRange(location: 0, length: text.count))
        originalPriceLabel.attributedText = attr
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        menuLabel.text = nil
        imageView.image = nil
        nameLabel.text = nil
        discountLabel.text = nil
        salePriceLabel.text = nil
        reviewCountLabel.text = nil
        originalPriceLabel.attributedText = nil
        reviewLabel.text = nil
    }
}

#Preview {
    RecommendStoreCell()
}

