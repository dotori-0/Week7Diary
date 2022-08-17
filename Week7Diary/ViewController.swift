//
//  ViewController.swift
//  Week7Diary
//
//  Created by SC on 2022/08/16.
//

import UIKit
import UIFramework

class ViewController: UIViewController {
    
    var name = "고래밥"
    
    private var age = 22
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        let vc = CodeViewController()
//        let vc = CodeSnapViewController()
        let vc = CodeSnap2ViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
        
        testOpen()
        
//        showAlert(title: "Test Alert", message: "Test Message", buttonTitle: "변경") { _ in
//            self.view.backgroundColor = .lightGray
//        }
        
//        let image = UIImage(systemName: "camera.macro")!
//        let shareURL = "https://www.apple.com"
//        let text = "WWDC What's New"
//        sesacShowActivityViewController(shareImage: image, shareURL: shareURL, shareText: text)
        
        OpenWebView.presentWebViewController(self, url: "https://www.naver.com", transitionStyle: .present)
        
    }

}

