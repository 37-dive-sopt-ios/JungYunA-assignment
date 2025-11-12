//
//  RootViewController.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/11/25.
//

import UIKit
import SnapKit

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
    }
    
    
}

extension RootViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        7
    }
}


extension RootViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else if section == 2{
            return 1
        } else if section == 3{
            return 1
        } else if section == 4{
            return 1
        } else if section == 5 {
            return 1
        } else if section == 6 {
            return 1
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell else {
                return UICollectionViewCell()
            }
            return cell
            
        } else if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchHeaderCell.identifier, for: indexPath) as? SearchHeaderCell else {
                return UICollectionViewCell()
            }
            return cell
        } else if indexPath.section == 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.identifier, for: indexPath) as? BannerCell else {
                return UICollectionViewCell()
            }
            return cell
        } else if indexPath.section == 3 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else {
                return UICollectionViewCell()
            }
            return cell
        } else if indexPath.section == 4 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.identifier, for: indexPath) as? MenuCell else {
                return UICollectionViewCell()
            }
            return cell
        } else if indexPath.section == 5 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopCell.identifier, for: indexPath) as? ShopCell else {
                return UICollectionViewCell()
            }
            return cell
        } else if indexPath.section == 6 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddCell.identifier, for: indexPath) as? AddCell else {
                return UICollectionViewCell()
            }
            return cell
        }
        
        return UICollectionViewCell()
    }
    
}

extension RootViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0  {
            return CGSize(width: UIScreen.main.bounds.width , height: 24)
        } else if indexPath.section == 1 {
            return CGSize(width: UIScreen.main.bounds.width , height: 50)
        } else if indexPath.section == 2 {
            return CGSize(width: UIScreen.main.bounds.width , height: 89)
        } else if indexPath.section == 3 {
            return CGSize(width: UIScreen.main.bounds.width , height: 48)
        } else if indexPath.section == 4 {
            return CGSize(width: UIScreen.main.bounds.width , height: 235)
        } else if indexPath.section == 5 {
            return CGSize(width: UIScreen.main.bounds.width , height: 96)
        } else if indexPath.section == 6 {
            return CGSize(width: UIScreen.main.bounds.width , height: 114)
        }
        
        return CGSize(width: 30, height: 30)
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 4 || section == 5 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}




#Preview {
    RootViewController()
}
