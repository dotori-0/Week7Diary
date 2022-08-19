//
//  WriteView.swift
//  Week7Diary
//
//  Created by SC on 2022/08/19.
//

import UIKit

class WriteView: BaseView {
    
    let photoImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemGray5
        view.contentMode = .scaleAspectFill
        return view
    }()
    
//    let titleTextField: UITextField = {
//        let view = UITextField()
//        view.borderStyle = .none
//        view.layer.borderColor = UIColor.black.cgColor
//        view.layer.borderWidth = 1
//        view.placeholder = "제목을 입력해 주세요"
//        view.textAlignment = .center
//        view.font = .boldSystemFont(ofSize: 15)
//        return view
//    }()
//
//    let dateTextField: UITextField = {
//        let view = UITextField()
//        view.borderStyle = .none
//        view.layer.borderColor = UIColor.black.cgColor
//        view.layer.borderWidth = 1
//        view.placeholder = "제목을 입력해 주세요"
//        view.textAlignment = .center
//        view.font = .boldSystemFont(ofSize: 15)
//        return view
//    }()
    
    let titleTextField: BlackRadiusTextField = {
        let view = BlackRadiusTextField()
        view.placeholder = "제목을 입력해 주세요"
        return view
    }()
    
    let dateTextField: BlackRadiusTextField = {
        let view = BlackRadiusTextField()
        view.placeholder = "제목을 입력해 주세요"
        return view
    }()

    
    let contentTextView: UITextView = {
        let view = UITextView()
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    // ☘️
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func configureUI() {
        [photoImageView, titleTextField, dateTextField, contentTextView].forEach {
            self.addSubview($0)
        }
    }
    
    
    override func setConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(self).multipliedBy(0.4)
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
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
