//
//  BaseView.swift
//  Week7Diary
//
//  Created by SC on 2022/08/19.
//

import UIKit
import SnapKit

class BaseView: UIView {
    
    // 코드 베이스
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        setConstraints()
    }
    
    // xib storyboard, protocol 기반
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() { }
    
    func setConstraints() { }
}


// required initializer

//protocol Example {
//    init(name: String)
//}
//
//class Mobile: Example {
//    let name: String
//
//    required init(name: String) {
//        self.name = name
//    }
//}
//
//class Apple: Mobile {
//    let wwdc: String
//
//    init(wwdc: String) {
//        self.wwdc = wwdc
//
//        super.init(name: "모바일")
//    }
    
//    required override init(name: String) {  // 초기화 구문이 프로토콜에서 왔다면 앞에 required 가 붙는다
//        <#code#>
//    }
//}

//let a = Apple(wwdc: "애플")

