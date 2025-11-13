//
//  RootViewController.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/11/25.
//

import UIKit
import SnapKit

private enum RootSection: Int, CaseIterable {
    case header
    case search
    case banner
    case category
    case menu
    case shop
    case add
    case recommend
    case recent
    case discount
}

final class RootViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let navigationView = NavigationView()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(named: "baemin_gray_200")
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override func setLayout() {
        view.addSubview(collectionView)
        view.addSubview(navigationView)
        
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        navigationView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(82)
        }
        
        collectionView.register(HeaderCell.self, forCellWithReuseIdentifier: HeaderCell.identifier)
        collectionView.register(SearchHeaderCell.self, forCellWithReuseIdentifier: SearchHeaderCell.identifier)
        collectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.identifier)
        collectionView.register(ShopCell.self, forCellWithReuseIdentifier: ShopCell.identifier)
        collectionView.register(AddCell.self, forCellWithReuseIdentifier: AddCell.identifier)
        collectionView.register(RecommendCell.self, forCellWithReuseIdentifier: RecommendCell.identifier)
        collectionView.register(RecentCell.self, forCellWithReuseIdentifier: RecentCell.identifier)
        collectionView.register(DiscountCell.self, forCellWithReuseIdentifier: DiscountCell.identifier)
    }
    
    
}

extension RootViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        RootSection.allCases.count
    }
}


extension RootViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let sectionType = RootSection(rawValue: section) else { return 0 }
        
        switch sectionType {
        case .header,
                .search,
                .banner,
                .category,
                .menu,
                .shop,
                .add,
                .recommend,
                .recent,
                .discount:
            return 1
        } //switch 대상이 enum 타입, enum의 모든 case가 switch문에 명시될 경우 default 생략 가능
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let sectionType = RootSection(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        
        switch sectionType {
        case .header:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HeaderCell.identifier,
                for: indexPath
            ) as? HeaderCell else { return UICollectionViewCell() }
            return cell
            
        case .search:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SearchHeaderCell.identifier,
                for: indexPath
            ) as? SearchHeaderCell else { return UICollectionViewCell() }
            return cell
            
        case .banner:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BannerCell.identifier,
                for: indexPath
            ) as? BannerCell else { return UICollectionViewCell() }
            return cell
            
        case .category:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryCell.identifier,
                for: indexPath
            ) as? CategoryCell else { return UICollectionViewCell() }
            cell.configure(with: category)
            return cell
            
        case .menu:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MenuCell.identifier,
                for: indexPath
            ) as? MenuCell else { return UICollectionViewCell() }
            cell.configure(with: menuData)
            return cell
            
        case .shop:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ShopCell.identifier,
                for: indexPath
            ) as? ShopCell else { return UICollectionViewCell() }
            cell.configure(with: shopData)
            return cell
            
        case .add:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AddCell.identifier,
                for: indexPath
            ) as? AddCell else { return UICollectionViewCell() }
            cell.configure(with: banner)   // 너가 만든 configure 그대로 사용
            return cell
            
        case .recommend:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecommendCell.identifier,
                for: indexPath
            ) as? RecommendCell else { return UICollectionViewCell() }
            cell.configure(with: dummyStores)
            return cell
            
        case .recent:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecentCell.identifier,
                for: indexPath
            ) as? RecentCell else { return UICollectionViewCell() }
            cell.configure(with: mockData)
            return cell
            
        case .discount:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DiscountCell.identifier,
                for: indexPath
            ) as? DiscountCell else { return UICollectionViewCell() }
            cell.configure(with: discountStore)
            return cell
        }
    }
}



extension RootViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let sectionType = RootSection(rawValue: indexPath.section) else {
            return CGSize(width: 30, height: 30)
        }
        
        let width = UIScreen.main.bounds.width
        
        switch sectionType {
        case .header:
            return CGSize(width: width, height: 29)
        case .search:
            return CGSize(width: width, height: 50)
        case .banner:
            return CGSize(width: width, height: 89)
        case .category:
            return CGSize(width: width, height: 48)
        case .menu:
            return CGSize(width: width, height: 235)
        case .shop:
            return CGSize(width: width, height: 96)
        case .add:
            return CGSize(width: width, height: 140)
        case .recommend:
            return CGSize(width: width, height: 350)
        case .recent:
            return CGSize(width: width, height: 300)
        case .discount:
            return CGSize(width: width, height: 360)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        guard let sectionType = RootSection(rawValue: section) else {
            return .zero
        }
        
        switch sectionType {
        case .menu, .shop, .add, .recommend, .recent:
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        default:
            return .zero
        }
    }
}




#Preview {
    RootViewController()
}
