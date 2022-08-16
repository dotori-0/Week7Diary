//
//  WalkthroughViewController.swift
//  Week7Diary
//
//  Created by SC on 2022/08/16.
//

import UIKit

class WalkthroughViewController: UIPageViewController {
    
    // 뷰 컨트롤러 배열
    var pageViewControllers: [UIViewController] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint

        createPageViewControllers()
        configurePageViewController()
    }
    

    // 배열에 뷰 컨트롤러 추가
    func createPageViewControllers() {
        let sb = UIStoryboard(name: "Walkthrough", bundle: nil)
        let vc1 = sb.instantiateViewController(withIdentifier: FirstViewController.reuseIdentifier) as! FirstViewController
        vc1.title = "vc1"
        let vc2 = sb.instantiateViewController(withIdentifier: SecondViewController.reuseIdentifier) as! SecondViewController
        vc2.title = "vc2"
        let vc3 = sb.instantiateViewController(withIdentifier: ThirdViewController.reuseIdentifier) as! ThirdViewController
        vc3.title = "vc3"
        
        pageViewControllers = [vc1, vc2, vc3]
    }
    
    
    func configurePageViewController() {
        delegate = self
        dataSource = self
        
        // display하고자 하는 뷰를 시작점으로
        guard let first = pageViewControllers.first else { return }
        // ➕
        let second = pageViewControllers[1]
        guard let last = pageViewControllers.last else { return }
        
        setViewControllers([first], direction: .forward, animated: true)
//        setViewControllers([first, second, last], direction: .forward, animated: true)  // ➕
        // The number of view controllers provided (3) doesn't match the number required (1) for the requested transition
    }
}


extension WalkthroughViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // 현재 페이지 뷰 컨트롤러에 보이는 뷰컨의 인덱스 가져오기
        guard let viewControllerIndex = pageViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        return previousIndex < 0 ? nil : pageViewControllers[previousIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // 현재 페이지 뷰 컨트롤러에 보이는 뷰컨의 인덱스 가져오기
        guard let viewControllerIndex = pageViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        return nextIndex >= pageViewControllers.count ? nil : pageViewControllers[nextIndex]
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageViewControllers.count
    }
    
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let first = viewControllers?.first, let index = pageViewControllers.firstIndex(of: first) else { return 0 }
        print(viewControllers)
        print(viewControllers?.count)
        print(pageViewController)
        print("====", first)
        print("====", first.title)
        print("====", index)
        return index
        
//        return 0
    }
}
