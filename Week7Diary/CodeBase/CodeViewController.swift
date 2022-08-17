//
//  CodeViewController.swift
//  Week7Diary
//
//  Created by SC on 2022/08/17.
//

import UIKit

/*
 공통
 1. 뷰 객체 프로퍼티 선언: 클래스의 인스턴스 생성
 2. 뷰 객체를 명시적으로 루트 뷰에 추가(이 과정이 빠진다면 시각적으로 드러나지 않음)
 3. 크기와 위치 및 속성 정의
    -> Frame 기반의 한계(iPhone 5가 등장하면서 디바이스 해상도가 다양해짐)
    -> AuthoResizingMask, AutoLayout 등장!
    -> NSLayoutConstraints
 */


class CodeViewController: UIViewController {
    
    // 1. 뷰 객체 프로퍼티 선언: 클래스의 인스턴스 생성
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signButton = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 2. 뷰 객체를 명시적으로 루트 뷰에 추가(이 과정이 빠진다면 시각적으로 드러나지 않음)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signButton)
        
        
        // 3. 크기와 위치 및 속성 정의 - Frame 기반
        emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50)
        emailTextField.borderStyle = .line
        emailTextField.backgroundColor = .systemGray4
        
        
        // 3. 크기와 위치 및 속성 정의 - NSLayoutConstraints (iOS 6 부터 등장)
        // 레거시로 볼 수 있다
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false  // 프레임기반부터 있던 것 IB상에서는 디폴트가 true
        passwordTextField.backgroundColor = .systemIndigo
//        let top = NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 100)
//        top.isActive = true  // 레이아웃 활성화
//        NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 50).isActive = true
//        NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: emailTextField, attribute: .trailing, multiplier: 1, constant: -50).isActive = true
//        NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
    
        
        // 3. NSLayoutConstraints addConstraints
        let top = NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 100)
        let leading = NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 50)
        let trailing = NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: emailTextField, attribute: .trailing, multiplier: 1, constant: -50)
        let height = NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60)
        
        view.addConstraints([top, leading, trailing, height])
        
        
        // 4. NSLayoutAnchor: 사용하는 비중이 좀 되기는 하다 (NS는 Objective-C에서 사용하던 것 NeXTSTEP의 약자)
        signButton.translatesAutoresizingMaskIntoConstraints = false
        signButton.backgroundColor = .systemMint
        
        NSLayoutConstraint.activate([
            signButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signButton.widthAnchor.constraint(equalToConstant: 300),
            signButton.heightAnchor.constraint(equalToConstant: 50),
            signButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
