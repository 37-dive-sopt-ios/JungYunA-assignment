//
//  LoginViewController.swift
//  BaminClone
//
//  Created by 정윤아 on 10/30/25.
//

import Foundation
import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 또는 아이디로 계속"
        label.font = UIFont(name: "Pretendard_SemiBold", size: 18)
        label.textAlignment = .center
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.tintColor = .black
        return button
        
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일 아이디"
        textField.setPlaceholder(color: UIColor(named: "baemin_gray_700") ?? .lightGray)
        textField.borderStyle = .none
        textField.backgroundColor = UIColor(named: "baemin_white")
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "baemin_gray_200")?.cgColor
        textField.font = UIFont(name: "Pretendard_Regular", size: 14)
        
        textField.addLeftPadding()
        textField.addRightPadding()
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.setPlaceholder(color: UIColor(named: "baemin_gray_700") ?? .lightGray)
        textField.borderStyle = .none
        textField.backgroundColor = UIColor(named: "baemin_white")
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "baemin_gray_200")?.cgColor
        textField.font = UIFont(name: "Pretendard_Regular", size: 14)
        
        textField.addLeftPadding()
        textField.addRightPadding()
        
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = UIColor(named: "baemin_gray_200")
        button.titleLabel?.font = UIFont(name: "Pretendard_Bold", size: 18)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        return button
    }()
    
    lazy var findAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("계정 찾기", for: .normal)
        button.setTitleColor(.baeminBlack, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard_Regular", size: 14)
        
        //아이콘
        let nextImage = UIImage(named: "next")
        button.setImage(nextImage, for: .normal)
        button.tintColor = .black
        
        //텍스트 이미지 간격 조정
        
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -4, bottom :0, right: 8)
        
        return button
    }()
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
        
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setHierarchy() {
        [
            titleLabel,
            backButton,
            emailTextField,
            passwordTextField,
            loginButton,
            findAccountButton
        ].forEach{self.view.addSubview($0)}
        
    }
    
    private func setLayout() {
        
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
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(46)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(82)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(46)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(148)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(46)
        }
        
        findAccountButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(226)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(14)
        }
        
    }
}




#Preview{
    let vc = LoginViewController()
        vc.loadViewIfNeeded()
        return UINavigationController(rootViewController: vc)
    }
