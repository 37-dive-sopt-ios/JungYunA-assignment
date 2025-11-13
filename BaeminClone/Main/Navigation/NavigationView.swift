//
//  NavigationView.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/13/25.
//
import UIKit
import SnapKit

final class NavigationView : BaseView {
    
    var homeButton : UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "home"), for: .normal)
        return b
    }()
    
    private let homeLabel : UILabel = {
        let l = UILabel()
        l.text = "홈"
        l.font = UIFont(name: "Pretendard-Regular", size: 10)
        l.textAlignment = .center
        return l
    }()
    
    var ShoppingButton : UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "shopping"), for: .normal)
        return b
    }()
    
    private let ShoppingLabel : UILabel = {
        let l = UILabel()
        l.text = "장보기.쇼핑"
        l.font = UIFont(name: "Pretendard-Regular", size: 9)
        l.textAlignment = .center
        return l
    }()
    
    var likeButton : UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "heart"), for: .normal)
        return b
    }()
    
    private let likeLabel : UILabel = {
        let l = UILabel()
        l.text = "찜"
        l.font = UIFont(name: "Pretendard-Regular", size: 10)
        l.textAlignment = .center
        return l
    }()
    
    var orderButton : UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "order"), for: .normal)
        return b
    }()
    
    private let orderLabel : UILabel = {
        let l = UILabel()
        l.text = "주문내역"
        l.font = UIFont(name: "Pretendard-Regular", size: 10)
        l.textAlignment = .center
        return l
    }()
    
    var baeminButton : UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "face"), for: .normal)
        return b
    }()
    
    private let baeminLabel : UILabel = {
        let l = UILabel()
        l.text = "마이배민"
        l.font = UIFont(name: "Pretendard-Regular", size: 10)
        l.textAlignment = .center
        return l
    }()
    
    override func setUI() {
        self.backgroundColor = .white
    }
    
    override func setLayout() {
        self.addSubviews(homeButton, homeLabel, ShoppingLabel, ShoppingButton, likeLabel, likeButton, orderLabel, orderButton, baeminLabel, baeminButton)
        
        homeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(15)
            $0.size.equalTo(CGSize(width: 44, height: 24))
        }
        
        homeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalToSuperview().offset(15)
            $0.size.equalTo(CGSize(width: 44, height: 10))
        }
        
        ShoppingButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(homeButton.snp.trailing).offset(31)
            $0.size.equalTo(CGSize(width: 44, height: 24))
        }
        
        ShoppingLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalTo(homeLabel.snp.trailing).offset(31)
            $0.size.equalTo(CGSize(width: 44, height: 10))
        }
        
        likeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(ShoppingButton.snp.trailing).offset(31)
            $0.size.equalTo(CGSize(width: 44, height: 24))
        }
        
        likeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalTo(ShoppingLabel.snp.trailing).offset(31)
            $0.size.equalTo(CGSize(width: 44, height: 10))
        }
        
        orderButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(likeButton.snp.trailing).offset(31)
            $0.size.equalTo(CGSize(width: 44, height: 24))
        }
        
        orderLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalTo(likeLabel.snp.trailing).offset(31)
            $0.size.equalTo(CGSize(width: 44, height: 10))
        }
        
        baeminButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(orderButton.snp.trailing).offset(31)
            $0.size.equalTo(CGSize(width: 44, height: 24))
        }
        
        baeminLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalTo(orderLabel.snp.trailing).offset(31)
            $0.size.equalTo(CGSize(width: 44, height: 10))
        }
        
    }
    
    
}

#Preview {
    NavigationView()
}
