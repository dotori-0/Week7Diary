//
//  ProfileViewController.swift
//  Week7Diary
//
//  Created by SC on 2022/08/18.
//

import UIKit

extension NSNotification.Name {
    static let saveButton = NSNotification.Name("saveButtonNotification")
}

class ProfileViewController: UIViewController {
    
    var testTitle: String?
    
    let saveButton: UIButton = {
        let view = UIButton()
        view.setTitle("저장", for: .normal)
        view.backgroundColor = .black
        return view
    }()
    
    let nameTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "이름을 입력하세요."
        view.backgroundColor = .systemPink
        view.textColor = .white
        return view
    }()
    
//    var saveButtonActionHandler: (() -> ())?  // 함수 자체
    var saveButtonActionHandler: ((String) -> ())?  // 함수 자체
    
    
    
    func configure() {
        [saveButton, nameTextField].forEach { view.addSubview($0) }
        
        nameTextField.snp.makeConstraints {
            $0.leading.trailing.equalTo(view).inset(50)
            $0.top.equalTo(50)
            $0.height.equalTo(50)
        }
        
        saveButton.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.center.equalTo(view)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configure()
        
        saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveButtonNotificationObserver(notification:)), name: NSNotification.Name("TEST"), object: nil)
    }
    
    @objc func saveButtonNotificationObserver(notification: NSNotification) {
        print(self, #function)
        if let name = notification.userInfo?["name"] as? String {
            print(name)
            self.nameTextField.text = name
        } else {
            
        }
    }
    
    var testHandler: (() -> Int)?
    
    @objc func saveButtonClicked() {
        // 2. Notification
        // ☘️ 3 굳이.. 스니펫으로
//        NotificationCenter.default.post(name: NSNotification.Name("saveButtonNotification"), object: nil, userInfo: ["name": nameTextField.text!, "value": 123456])
        NotificationCenter.default.post(name: .saveButton, object: nil, userInfo: ["name": nameTextField.text!, "value": 123456])
        
        // 1. 값 전달 기능 실행 -> 클로저 구문 활용
//        saveButtonActionHandler?()
//        saveButtonActionHandler?(nameTextField.text!)
//        print(testHandler?())
        
        // 화면 Dismiss
        dismiss(animated: true)
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
