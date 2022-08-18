//
//  FirstViewController.swift
//  Week7Diary
//
//  Created by SC on 2022/08/16.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var walkthroughLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(systemName: "pawprint.fill")
        
//        view.backgroundColor = .red

        walkthroughLabel.numberOfLines = 0
        walkthroughLabel.font = .boldSystemFont(ofSize: 25)
//        walkthroughLabel.backgroundColor = .red
        walkthroughLabel.layer.backgroundColor = UIColor.red.cgColor
        walkthroughLabel.text = """
        일기 씁시다!
        잘 써 봅시다!
        """
        
        lineView.backgroundColor = .label
        lineView.alpha = 0
        
//        walkthroughLabel.alpha = 0
        
//        UIView.animate(withDuration: 5) {
        UIView.animate(withDuration: 5, delay: 0, options: [.repeat, .autoreverse]) {
//            self.walkthroughLabel.alpha = 1
            self.walkthroughLabel.layer.backgroundColor = UIColor.yellow.cgColor
//            self.walkthroughLabel.backgroundColor = .yellow
//            self.walkthroughLabel.backgroundColor = .red
            
//            self.view.backgroundColor = .blue  // view.backgroundColor 애니메이션 변경 적용 O

        } completion: { _ in
            self.animateLineView()
        }
    }
    
    
    func animateLineView() {
        UIView.animate(withDuration: 2) {
//            self.lineView.frame.size.width += 250
            self.lineView.transform = CGAffineTransform(scaleX: 35, y: 1)  // 몇 배로 늘릴 건지
//            self.lineView.transform = CGAffineTransform(
            self.lineView.alpha = 1
            
        } completion: { _ in
            self.animateImageView()
        }
    }
    

    func animateImageView() {
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
            self.imageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        } completion: { bool in
            print("🐾", bool)
        }
    }
}
