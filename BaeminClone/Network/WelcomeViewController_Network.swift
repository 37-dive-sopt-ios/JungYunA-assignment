//
//  WelcomeViewController_Network.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/22/25.
//

import UIKit
import SnapKit

final class WelcomeViewController_Network: BaseViewController {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "환영합니다!"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var deleteUserButton: UIButton = {
        let button = createButton(title: "회원탈퇴 (DELETE /api/v1/users/{userId})",
                                  color: .systemRed)
        button.addTarget(self,
                         action: #selector(deleteUserButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    // MARK: - Properties
    
    private let userId: Int
    private let userName: String
    private let provider: NetworkProviding
    
    // MARK: - Init
    
    public init(
        userId: Int,
        userName: String,
        provider: NetworkProviding = NetworkProvider()
    ) {
        self.userId = userId
        self.userName = userName
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        titleLabel.text = "\(userName)님,\n환영합니다!"
        
        setHierarchy()
        setLayout()
    }
    
    // MARK: - UI Setup
    
    private func setHierarchy() {
        view.addSubviews(
            titleLabel,
            deleteUserButton
        )
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        deleteUserButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(32)
            $0.horizontalEdges.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
        
        loadingIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc private func deleteUserButtonTapped() {
        showDeleteConfirmation()
    }
    
    // MARK: - Helpers
    
    private func createButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 8
        return button
    }
    
    private func showDeleteConfirmation() {
        showAlert(
            title: "회원탈퇴",
            message: "정말로 이 계정을 삭제하시겠습니까?"
        ) { [weak self] in
            guard let self else { return }
            Task {
                await self.performDeleteUser()
            }
        }
    }
    
    @MainActor
    private func performDeleteUser() async {
        loadingIndicator.startAnimating()
        
        do {
            try await UserAPI.performDeleteUser(
                userId: userId,
                provider: provider
            )
            
            showAlert(title: "탈퇴 완료", message: "계정이 삭제되었습니다.") { [weak self] in
                // 탈퇴 후 이전 화면으로 돌아가기
                self?.navigationController?.popToRootViewController(animated: true)
            }
        } catch let error as NetworkError {
            print("🚨 [Delete Error] \(error.detailedDescription)")
            showAlert(title: "탈퇴 실패", message: error.localizedDescription)
        } catch {
            print("🚨 [Delete Unknown Error] \(error)")
            showAlert(title: "탈퇴 실패", message: error.localizedDescription)
        }
        
        loadingIndicator.stopAnimating()
    }
}

