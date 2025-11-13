//
//  RecentStoreCell.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/13/25.
//
import UIKit
import SnapKit

final class RecentStoreCell : UICollectionViewCell {
    
    static let identifier: String = "RecentStoreCell"
    
    // MARK: - UI Components
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Bold", size: 14)
        label.textColor = UIColor(named: "baemin_black")
        label.textAlignment = .left
        return label
    }()
    
    private let reviewCountLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.textColor = UIColor(named: "baemin_gray_600")
        label.textAlignment = .center
        return label
    }()
    
    private let reviewLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Bold", size: 14)
        label.textColor = UIColor(named: "baemin_black")
        label.textAlignment = .center
        return label
    }()
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var reviewStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [starImageView, reviewLabel,reviewCountLabel])
        stack.axis = .horizontal
        stack.spacing = 1
        stack.alignment = .center
        return stack
    }()
    
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4
        imageView.backgroundColor = UIColor(named: "baemin_gray_200")
        return imageView
    }()
    
    private let baeminIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "baemin_money")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 13)
        label.textColor = UIColor(named: "baemin_black")
        label.textAlignment = .left
        return label
    }()
    
    private lazy var timeStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [baeminIconImageView, timeLabel])
        stack.axis = .horizontal
        stack.spacing = 2
        stack.alignment = .center
        return stack
    }()
    
    private let baeminClubIcon : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "baemin_club")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let baeminClubLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Bold", size: 13)
        label.textColor = UIColor(red: 84/255, green: 21/255, blue: 255/255, alpha: 100)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var baeminClubStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [baeminClubIcon, baeminClubLabel])
        stack.axis = .horizontal
        stack.spacing = 0.5
        stack.alignment = .center
        return stack
    }()
    
    private let recentOrder: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "recent_time")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let recentOrederLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 12)
        label.textColor = UIColor(red: 0/255, green: 126/255, blue: 255/255, alpha: 100)
        label.textAlignment = .left
        return label
    }()
    
    
    private lazy var recentStackView : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [recentOrder, recentOrederLabel])
        stack.axis = .horizontal
        stack.spacing = 2
        stack.alignment = .leading
        return stack
    }()
    
    private let badgeImage : UIImageView = {
        let badge = UIImageView()
        badge.image = UIImage(named: "badge")
        badge.contentMode = .scaleAspectFit
        return badge
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
        contentView.clipsToBounds = true
    }
    
    private func setHierarchy() {
        contentView.addSubviews(nameLabel, imageView, badgeImage, recentStackView, baeminClubStackView, timeStackView, reviewStackView, badgeImage )
    }
    
    private func setLayout() {
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(126)
            
        }
        
        recentStackView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(12)
            $0.leading.equalToSuperview()
            $0.width.equalTo(150)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(33)
            $0.leading.equalToSuperview()
            $0.width.equalTo(110)
            $0.height.equalTo(14)
        }
        
        reviewStackView.snp.makeConstraints {
            $0.centerY.equalTo(nameLabel)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(3)
            $0.height.equalTo(14)
            $0.width.equalTo(70)
        }
        
        timeStackView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(54)
            $0.leading.equalToSuperview()
            $0.height.equalTo(13)
            $0.width.equalTo(70)
        }
        
        baeminIconImageView.snp.makeConstraints {
            $0.width.equalTo(12)
            $0.height.equalTo(12)
        }
        
        recentOrder.snp.makeConstraints {
            $0.width.equalTo(13)
            $0.height.equalTo(13)
        }
        
        baeminClubStackView.snp.makeConstraints {
            $0.centerY.equalTo(timeStackView)
            $0.leading.equalTo(timeStackView.snp.trailing).offset(6)
            $0.width.equalTo(56)
            $0.height.equalTo(13)
        }
        
        badgeImage.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(74)
            $0.leading.equalToSuperview()
            $0.width.equalTo(56)
            $0.height.equalTo(16)
        }
        
        
        
    }
    
    func configure(with store: RecentStore) {
        imageView.image = UIImage(named: store.storeImage)
        nameLabel.text = store.store
        reviewLabel.text = "\(store.review)"
        reviewCountLabel.text = "(\(store.reviewCount))"
        timeLabel.text = "\(store.time)분"
        baeminClubLabel.text = store.baeminClub
        recentOrederLabel.text = "최근 \(store.recentOrder)번 주문한 가게"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        reviewLabel.text = nil
        reviewCountLabel.text = nil
        timeLabel.text = nil
        baeminClubLabel.text = nil
        recentOrederLabel.text = nil
    }
}

#Preview {
    RecentStoreCell()
}

