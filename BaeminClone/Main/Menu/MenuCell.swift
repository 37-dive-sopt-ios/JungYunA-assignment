//
//  MenuCell.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/12/25.
//

import UIKit
import SnapKit

final class MenuCell : UICollectionViewCell {
    
    static let identifier: String = "MenuCell"
    
    // MARK: - Properties
    
    private let lineSpacing: CGFloat = 8
    private let itemSpacing: CGFloat = 12
    private let cellHeight: CGFloat = 78
    private let collectViewInset: UIEdgeInsets = .init(top: 12, left: 16, bottom: 55, right: 16)
    
    
    // MARK: - UI Components
    
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
    
    // 구분선
    private let divider: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(named: "baemin_background_white")
        return v
    }()
    
    // "음식배달에서 더보기  >" 버튼 (가운데 정렬)
    private lazy var moreButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("음식배달에서 더보기 >", for: .normal)
        b.setTitleColor(UIColor(named: "baemin_black")!, for: .normal)
        b.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 14)
        return b
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
        self.addSubview(divider)
        self.addSubview(moreButton)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            
        }
        
        divider.snp.makeConstraints {
            $0.top.equalToSuperview().offset(201)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10) // 셀의 바닥까지
            $0.height.equalTo(32)
        }
        
        collectionView.register(MenuNameCell.self, forCellWithReuseIdentifier: MenuNameCell.identifier)
        
        
    }
}

extension MenuCell: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}


extension MenuCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuNameCell.identifier, for: indexPath) as? MenuNameCell else {
            return UICollectionViewCell()
        }
        return cell
        
    }
}

extension MenuCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 65, height: 78)
        
    }
    
    
}
