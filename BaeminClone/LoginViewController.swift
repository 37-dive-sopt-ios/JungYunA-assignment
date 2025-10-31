//
//  LoginViewController.swift
//  BaminClone
//
//  Created by 정윤아 on 10/30/25.
//

import Foundation
import UIKit
import SnapKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 또는 아이디로 계속"
        label.font = UIFont(name: "Pretendard-SemiBold", size: 18)
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
        
        textField.delegate = self
        textField.returnKeyType = .next
        textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
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
        
        textField.delegate = self
        textField.isSecureTextEntry = true
        textField.returnKeyType = .done
        textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        
        //전체 삭제
        let clearButton = UIButton()
        clearButton.setImage(UIImage(named: "cancle"), for: .normal)
        clearButton.addTarget(self, action: #selector(clearPasswordField), for: .touchUpInside)
        
        //눈 버튼
        let eyeButton = UIButton()
        eyeButton.setImage(UIImage(named: "eyeslash"), for: .normal) //기본은 가려져 있음
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        
        //버튼 2개 묶기
        let rightStack = UIStackView(arrangedSubviews: [clearButton, eyeButton])
        rightStack.axis = .horizontal
        rightStack.spacing = 20
        
        let container = UIView()
        container.addSubview(rightStack)
        rightStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
        textField.rightView = container
        textField.rightViewMode = .always
        
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = UIColor(named: "baemin_gray_200")
        button.titleLabel?.font = UIFont(name: "Pretendard_Bold", size: 18)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.isEnabled = false //기본값 비활성화
         
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    lazy var findAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("계정 찾기 >", for: .normal)
        button.setTitleColor(.baeminBlack, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard_Regular", size: 14)
        
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
    
    // MARK: - Action
    
    //이메일, 비밀번호 입력 감지 후 로그인 버튼 활성화
    @objc
    private func textDidChange(_ textField: UITextField) {
        let emailFilled = !(emailTextField.text ?? "").trimmingCharacters(in: .whitespaces).isEmpty
        let passwordFilled = !(passwordTextField.text ?? "").trimmingCharacters(in: .whitespaces).isEmpty
        
        if emailFilled && passwordFilled {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor(named: "baemin_mint_500") ?? .blue
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = UIColor(named: "baemin_gray_200") ?? .lightGray
        }
    }
    
    //비밀번호 보기, 숨기기
    @objc
    private func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        if let button = (passwordTextField.rightView as? UIView)?.subviews.first(where: { $0 is UIStackView })?.subviews.last as? UIButton {
            let icon = passwordTextField.isSecureTextEntry ? "eyeslash" : "eye"
            button.setImage(UIImage(named: icon), for: .normal)
        }
    }
    
    //비밀번호 전체 삭제
    @objc
    private func clearPasswordField() {
        passwordTextField.text = ""
        textDidChange(passwordTextField)
    }
    
    private func pushToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.id = emailTextField.text
        self.navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    //로그인 버튼 눌렀을 때 화면 전환
    @objc
    private func loginButtonDidTap() {
        self.pushToWelcomeVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emailTextField.text = ""
        passwordTextField.text = ""
        
        loginButton.isEnabled = false
        loginButton.backgroundColor = UIColor(named: "baemin_gray_200") ?? .lightGray
    }
    
    // MARK: - deleagate
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        textField.layer.borderColor = UIColor(named: "baemin_black")?.cgColor
        textField.layer.borderWidth = 2
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        textField.layer.borderColor = UIColor(named: "baemin_gray_200")?.cgColor
        textField.layer.borderWidth = 1
    
    }
    
    //엔터 치면 다음 칸으로 넘어가게
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    
    
    
    

}




#Preview{
    let vc = LoginViewController()
        vc.loadViewIfNeeded()
        return UINavigationController(rootViewController: vc)
    }
