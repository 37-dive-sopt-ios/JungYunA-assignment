//
//  AddCell.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/13/25.
//

import UIKit
import SnapKit

final class AddCell : UICollectionViewCell {
    
    static let identifier: String = "AddCell"
    
    private var banner : [Banner] = []
    
    
    
    
    // MARK: - Properties
    
    private let lineSpacing: CGFloat = 0
    private let cellHeight: CGFloat = 74
    private let collectViewInset: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
    
    
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
        
        collectionView.register(AddNameCell.self, forCellWithReuseIdentifier: AddNameCell.identifier)
    }
    
    func configure(with banner : [Banner]) {
        self.banner = banner
        collectionView.reloadData()
        
    }
    
}

extension AddCell: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}


extension AddCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banner.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddNameCell.identifier, for: indexPath) as? AddNameCell else {
            return UICollectionViewCell()
        }
        
        let banner = banner[indexPath.item]
        cell.configure(with: banner)
        return cell
        
    }
}

extension AddCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
    }
    
    
}
