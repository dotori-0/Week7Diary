//
//  ViewController.swift
//  Week7Diary
//
//  Created by SC on 2022/08/16.
//

import UIKit

import SnapKit
import UIFramework


class ViewController: UIViewController {
    
//    var name = "고래밥"
//    private var age = 22
//
//    var testArray: Array<Int> = [1, 2, 3, 4]
//    var testDict: Dictionary<Int, String> = [:]
//    var testSet: Set = [2, 3, 4]
    
    let nameButton: UIButton = {
        let view = UIButton()
        view.setTitle("닉네임", for: .normal)
//        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .systemIndigo
//        view.tintColor = .black
        
//        print("nameButton.showsTouchWhenHighlighted: \(view.showsTouchWhenHighlighted)")  // false
//        view.showsTouchWhenHighlighted = true
//        print("view.isHighlighted: \(view.isHighlighted)")  // false
//        view.isHighlighted = true
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        nameButton.addTarget(self, action: #selector(nameButtonClicked), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveButtonNotificationObserver(notification:)), name: NSNotification.Name("saveButtonNotification"), object: nil)
    }
    
    @objc func saveButtonNotificationObserver(notification: NSNotification) {
        if let name = notification.userInfo?["name"] as? String {
            print(name)
            self.nameButton.setTitle(name, for: .normal)
        } else {
            
        }
    }
    
    
    @objc func nameButtonClicked() {
        NotificationCenter.default.post(name: NSNotification.Name("TEST"), object: nil, userInfo: ["name": "\(Int.random(in: 1...100))", "value": 123456])
        
        
        let vc = ProfileViewController()
//        vc.saveButtonActionHandler = {
//            self.nameButton.setTitle(vc.nameTextField.text, for: .normal)
//        }
        vc.saveButtonActionHandler = { name in
            self.nameButton.setTitle(name, for: .normal)
        }
//        vc.testHandler = {
//            return 100
//        }
//        vc.testTitle = "테스트"
        
//        let vc = WriteViewController()
        
        present(vc, animated: true)
//        present(ProfileViewController(), animated: true)
    }
    
    
    func configure() {
        view.addSubview(nameButton)
        
        nameButton.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalTo(view)
        }
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
//        let vc = CodeViewController()
//        let vc = CodeSnapViewController()
//        let vc = CodeSnap2ViewController()
//        vc.modalPresentationStyle = .overFullScreen
//        present(vc, animated: true)
//
//        testOpen()
        
//        showAlert(title: "Test Alert", message: "Test Message", buttonTitle: "변경") { _ in
//            self.view.backgroundColor = .lightGray
//        }
        
//        let image = UIImage(systemName: "camera.macro")!
//        let shareURL = "https://www.apple.com"
//        let text = "WWDC What's New"
//        sesacShowActivityViewController(shareImage: image, shareURL: shareURL, shareText: text)
        
//        OpenWebView.presentWebViewController(self, url: "https://www.naver.com", transitionStyle: .present)
        
        
        
    }

}

