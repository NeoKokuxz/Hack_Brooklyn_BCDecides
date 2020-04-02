//
//  PageListViewController.swift
//  JobApp
//
//  Created by Naoki on 3/29/20.
//  Copyright © 2020 Naoki. All rights reserved.
//

import UIKit

class PageListViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    lazy var orderedViewController: [UIViewController] = {
        return [self.newVc(viewcontroller: "S1"),
                self.newVc(viewcontroller: "S2"),
                self.newVc(viewcontroller: "S3"),
                self.newVc(viewcontroller: "S4"),
                self.newVc(viewcontroller: "S5")]
        
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.dataSource = self
        if let firstVC = orderedViewController.first {
            setViewControllers([firstVC],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
    }
    
    func newVc(viewcontroller: String) -> UIViewController{
        return UIStoryboard(name:"Main", bundle: nil).instantiateViewController(identifier: viewcontroller)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            //Dismiss page function insert here - maybe
            return orderedViewController.last
        }
        
        guard orderedViewController.count > previousIndex else {
            return nil
        }
        
        return orderedViewController[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewController.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard orderedViewController.count != nextIndex else {
            //Dismiss page function insert here - maybe
            return orderedViewController.first
        }
        
        guard orderedViewController.count > nextIndex else {
            return nil
        }
        
        return orderedViewController[nextIndex]
        
    }
}
    
