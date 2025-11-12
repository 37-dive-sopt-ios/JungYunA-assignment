//
//  ShopCell.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/12/25.
//

import UIKit
import SnapKit

final class ShopCell : UICollectionViewCell {
    
    static let identifier: String = "ShopCell"
    
    // MARK: - Properties
    
    private let lineSpacing: CGFloat = 9
    private let cellHeight: CGFloat = 74
    private let collectViewInset: UIEdgeInsets = .init(top: 11, left: 16, bottom: 11, right: 16)
    
    
    // MARK: - UI Components
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = lineSpacing
        layout.sectionInset = collectViewInset
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
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
        contentView.backgroundColor = .white
    }
    
    private func setLayout() {
        self.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            
        }
        
        collectionView.register(ShopNameCell.self, forCellWithReuseIdentifier: ShopNameCell.identifier)
        
        
    }
}

extension ShopCell: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}


extension ShopCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopNameCell.identifier, for: indexPath) as? ShopNameCell else {
            return UICollectionViewCell()
        }
        return cell
        
    }
}

extension ShopCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 58, height: 74)
        
    }
    
    
}
