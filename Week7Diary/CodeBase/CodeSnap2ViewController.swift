//
//  CodeSnap2ViewController.swift
//  Week7Diary
//
//  Created by SC on 2022/08/17.
//

import UIKit

import SnapKit


class CodeSnap2ViewController: UIViewController {
    
    let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        [redView, blackView].forEach {
            view.addSubview($0)
        }
        
        redView.addSubview(yellowView)  // containerView, stackView는 addSubview가 아닌 다른 메서드를 사용해야 함
        
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view)
        }
        
        blackView.snp.makeConstraints { make in
//            make.edges.equalTo(redView).offset(50)  // x축 y축 상관없이 무조건 플러스가 되는 형태
            make.edges.equalTo(redView).inset(50)
        }
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
