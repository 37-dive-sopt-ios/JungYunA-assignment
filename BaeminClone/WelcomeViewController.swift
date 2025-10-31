//
//  WelcomeViewController.swift
//  BaeminClone
//
//  Created by 정윤아 on 10/31/25.
//

import Foundation
import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
    
    var id: String?
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "대체 뼈찜 누가 시켰어??"
        title.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        title.textAlignment = .center
        
        return title
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        return button
    }()
    
    private let welcomeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "welcome")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "환영합니다"
        label.font = UIFont(name: "Pretendard-Bold", size: 24)
        label.textAlignment = .center
        
        return label
    }()
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.text = "ㅇㅇ님 반가워요!"
        label.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var backtoLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기", for: .normal)
        button.backgroundColor = UIColor(named: "baemin_mint_500")
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.setTitleColor(UIColor(named: "baemin-white"), for: .normal)
        button.layer.cornerRadius = 4
         
        button.addTarget(self, action: #selector(backToLogin), for: .touchUpInside)
        return button
        
    }()
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setLayout()
        bindID()
        
    }
    
    private func setLayout() {
        [welcomeImage, welcomeLabel,idLabel,titleLabel, backButton, backtoLoginButton].forEach{self.view.addSubview($0)}
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(45)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(36)
        }
        
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(45)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalTo(backButton)
            $0.height.equalTo(42)
        }
        
        welcomeImage.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(0)
            $0.trailing.equalToSuperview().offset(0)
            $0.height.equalTo(211)
        }
        
        welcomeLabel.snp.makeConstraints{
            $0.top.equalTo(welcomeImage.snp.bottom).offset(24)
            $0.horizontalEdges.equalToSuperview().inset(130)
            $0.height.equalTo(24)
        }
        
        idLabel.snp.makeConstraints{
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(130)
            $0.height.equalTo(18)
        }
        
        backtoLoginButton.snp.makeConstraints{
            $0.top.equalTo(idLabel.snp.bottom).offset(326)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(52)
            
        }
    }
    
    @objc
    private func backToLogin(){
        navigationController?.popViewController(animated: true)
    }
    
    private func bindID() {
        
        if let name = id {
            self.idLabel.text = "\(name)님 반가워요!"
        } else {
            print("ㅇㅇ님 반가워요!")
        }
        
    }
}

