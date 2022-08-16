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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        walkthroughLabel.numberOfLines = 0
        walkthroughLabel.font = .boldSystemFont(ofSize: 25)
        walkthroughLabel.text = """
        일기 씁시다!
        잘 써 봅시다!
        """
        
        lineView.backgroundColor = .label
        lineView.alpha = 0
        
        walkthroughLabel.alpha = 0
        UIView.animate(withDuration: 2) {
            self.walkthroughLabel.alpha = 1
        } completion: { _ in
            self.animateLineView()
        }

    }
    
    
    func animateLineView() {
        UIView.animate(withDuration: 5) {
            self.lineView.frame.size.width += 250
            self.lineView.alpha = 1
            
        } completion: { _ in
            
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
