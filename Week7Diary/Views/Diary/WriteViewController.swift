//
//  WriteViewController.swift
//  Week7Diary
//
//  Created by SC on 2022/08/19.
//

import UIKit

import SnapKit


class WriteViewController: BaseViewController {
    
    let mainView = WriteView()
    
    // viewDidLoad()보다 먼저 호출
    override func loadView() {  // super.loadView() 호출 X (호출하면 기본 값인 nil이 들어온다)
        self.view = mainView  // 루트 뷰 교체
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 이미 BaseViewController에서 호출하도록 설정했기 때문에
        // configureUI와 setConstraints 호출 필요 X
        // -> WriteView에서 하고 있기 때문에 호출 필요 X
        
        
    }
    
    override func configureUI() {
        mainView.titleTextField.addTarget(self, action: #selector(titleTextFieldClicked(_:)), for: .editingDidEndOnExit)
    }
    
    // 여러 방법이 있음
//    @objc func titleTextFieldClicked() {
//        guard let text = mainView.titleTextField.text, text.count > 0 else {
    @objc func titleTextFieldClicked(_ textField: UITextField) {
        guard let text = textField.text, text.count > 0 else {
            showAlertMessage(title: "제목을 입력해 주세요", buttonTitle: "확인")
            return
        }
    }
    
//    override func configureUI() { }
    
//    override func setConstraints() { }
}
