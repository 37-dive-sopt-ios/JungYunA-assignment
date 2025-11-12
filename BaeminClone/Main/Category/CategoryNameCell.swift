//
//  CategoryNameCell.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/12/25.
//

import UIKit
import SnapKit

final class CategoryNameCell : UICollectionViewCell {
    
    static let identifier: String = "CategoryNameCell"
    
    // MARK: - UI Components
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        label.textColor = UIColor(named: "baemin_gray_200")
        label.text = "음식 배달"
        label.textAlignment = .center
        return label
    }()
    
    private let underline: UIView = {
        let v = UIView()
        v.backgroundColor = .black
        v.isHidden = true
        return v
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
        contentView.addSubviews(nameLabel, underline)
    }
    
    private func setLayout() {
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.horizontalEdges.equalToSuperview()
            
        }
        
        underline.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        
    }
    
    // MARK: - Configuration
    
    //    public func configure(feed: FeedModel) {
    //        nameLabel.text = feed.name
    //    }
}

#Preview{
    CategoryNameCell()
}
