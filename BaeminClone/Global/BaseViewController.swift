//
//  BaseViewController.swift
//  BaeminClone
//
//  Created by 정윤아 on 11/10/25.
//
import UIKit

class BaseViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUI()
        setLayout()
    }
    
    func setUI(){}
    func setLayout(){}
}
