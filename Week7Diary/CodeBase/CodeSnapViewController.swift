//
//  CodeSnapViewController.swift
//  Week7Diary
//
//  Created by SC on 2022/08/17.
//

import UIKit
import SnapKit


class CodeSnapViewController: UIViewController {
    
    let photoImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemGray5
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let titleTextField: UITextField = {
        print("UITextField")
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "제목을 입력해 주세요"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    
    let dateTextField: UITextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "제목을 입력해 주세요"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    
    let contentTextView: UITextView = {
        let view = UITextView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)

        configureUI()
    }
    

    func configureUI() {
//        view.addSubview(photoImageView)
//        photoImageView.translatesAutoresizingMaskIntoConstraints = false  // SnapKit에 구현되어 있음
        
        // for-in vs forEach 하나씩 순회 vs 클로저
        // Collection type을 순회하는 기능은 동일하지만, 구현 원리나 동작 구조가 다르다
        // forEach: 고차함수 종류 중 하나
        [photoImageView, titleTextField, dateTextField, contentTextView].forEach {
            view.addSubview($0)
        }
        
//        photoImageView.backgroundColor = .systemGray5
//        photoImageView.contentMode = .scaleAspectFill
//
//        titleTextField.borderStyle = .none
//        titleTextField.layer.borderColor = UIColor.black.cgColor
//        titleTextField.layer.borderWidth = 1
//        titleTextField.placeholder = "제목을 입력해 주세요"
//        titleTextField.textAlignment = .center
//        titleTextField.font = .boldSystemFont(ofSize: 15)
        
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(view).multipliedBy(0.4)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
//            make.topMargin.equalTo(20)
            make.leadingMargin.equalTo(20)
//            make.leading.equalTo(photoImageView.snp.leading)  // 상동
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
//            make.topMargin.equalTo(20)
            make.leadingMargin.equalTo(20)
//            make.leading.equalTo(photoImageView.snp.leading)  // 상동
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        
        contentTextView.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
//            make.bottom.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
