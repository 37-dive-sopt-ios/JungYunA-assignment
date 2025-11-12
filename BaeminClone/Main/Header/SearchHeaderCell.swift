//
//  SearchHeaderCell.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/11/25.
//
import UIKit
import SnapKit

final class SearchHeaderCell: UICollectionViewCell {
    
    static let identifier: String = "SearchHeaderCell"
    
    var searchTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "찾아라! 맛있는 음식과 맞집"
        textField.textColor = UIColor(named: "baemin_gray_300")
        textField.font = UIFont(name: "Pretendard-Regular", size: 14)
        textField.borderStyle = .none
        textField.backgroundColor = UIColor(named: "baemin_white")
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "baemin_black")?.cgColor
        textField.addLeftPadding(17)
        
        //검색
        let searchButton = UIButton()
        searchButton.setImage(UIImage(named: "search"), for: .normal)
        searchButton.tintColor = UIColor(named: "baemin_gray_700")
        
        let container = UIView()
        container.addSubview(searchButton)
        searchButton.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(17)
        }
        
        textField.rightView = container
        textField.rightViewMode = .always
        
        return textField
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
    
    private func setUI() {
        contentView.backgroundColor = UIColor(named: "baemin_gray_200")
    }
    
    private func setLayout(){
        
        self.addSubviews(searchTextField)
        
        searchTextField.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(40)
            
        }
        
        
    }
    
}

#Preview {
    SearchHeaderCell()
}
