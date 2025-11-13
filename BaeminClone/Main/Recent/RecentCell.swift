//
//  RecentCell.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/13/25.
//

import UIKit
import SnapKit

final class RecentCell : UICollectionViewCell {
    
    static let identifier: String = "RecentCell"
    
    private var stores: [RecentStore] = []
    
    // MARK: - Properties
    
    private let lineSpacing: CGFloat = 10
    private let itemSpacing: CGFloat = 12
    private let cellHeight: CGFloat = 78
    private let collectViewInset: UIEdgeInsets = .init(top: 0, left: 16, bottom: 20, right: 16)
    
    
    // MARK: - UI Components
    
    private let headerView = RecentCollectionHeaderView()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = itemSpacing
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
        contentView.addSubview(collectionView)
        contentView.addSubview(headerView)
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
            
        }
        
        
        collectionView.register(RecentStoreCell.self, forCellWithReuseIdentifier: RecentStoreCell.identifier)
        
        
    }
    
    func configure(with stores: [RecentStore]) {
        self.stores = stores
        collectionView.reloadData()
    }
}

extension RecentCell: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}


extension RecentCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return stores.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentStoreCell.identifier, for: indexPath) as? RecentStoreCell else {
            return UICollectionViewCell()
        }
        
        let store = stores[indexPath.item]
        cell.configure(with: store)
        return cell
        
    }
}

extension RecentCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 180, height: 220)
        
    }
    
    
}

#Preview {
    RecentCell()
}
