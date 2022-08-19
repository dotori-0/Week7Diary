//
//  BaseViewController.swift
//  Week7Diary
//
//  Created by SC on 2022/08/19.
//

import UIKit


class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
//        configureUI()
//        setConstraints()
    }
    
    func configureUI() { }
    
//    func setConstraints() { }
    
    func showAlertMessage(title: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: buttonTitle, style: .cancel)
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
}
