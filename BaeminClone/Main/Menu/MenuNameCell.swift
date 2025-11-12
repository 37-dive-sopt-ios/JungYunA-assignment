//
//  MenuNameCell.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/12/25.
//

import UIKit
import SnapKit

final class MenuNameCell : UICollectionViewCell {
    
    static let identifier: String = "MenuNameCell"
    
    // MARK: - UI Components
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.textColor = UIColor(named: "baemin_gray_200")
        label.text = "치킨"
        label.textAlignment = .center
        return label
    }()
    
    private let imageLabel : UILabel = {
       let label = UILabel()
        label.backgroundColor = UIColor(named: "baemin_gray_200")
        label.layer.cornerRadius = 20
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
        contentView.addSubviews(nameLabel, imageLabel)
    }
    
    private func setLayout() {
        
        imageLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalTo(58)
            $0.height.equalTo(58)
            $0.horizontalEdges.equalToSuperview().inset(2)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(imageLabel.snp.bottom).offset(6)
            $0.width.equalTo(58)
            
        }
        
        
    }
}

