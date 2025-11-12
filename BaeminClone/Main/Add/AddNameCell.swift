//
//  AddNameCell.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/13/25.
//

import UIKit
import SnapKit

final class AddNameCell : UICollectionViewCell {
    
    static let identifier: String = "AddNameCell"
    
    // MARK: - UI Components
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI & Layout
    
    //    private func setUI() {
    //        contentView.backgroundColor = .yellow
    //    }
    
    private func setHierarchy() {
        contentView.addSubviews(nameLabel)
    }
    
    private func setLayout() {
        
        nameLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        
    }
}

