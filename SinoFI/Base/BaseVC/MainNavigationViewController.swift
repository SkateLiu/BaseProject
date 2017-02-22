//
//  MainNavigationViewController.swift
//  SinoFI
//
//  Created by 刘 强 on 2017/2/22.
//  Copyright © 2017年 刘 强. All rights reserved.
//

import UIKit

class MainNavigationViewController: UINavigationController {

    override func loadView() {
        super.loadView()
        let navigationTitleAttribute : NSDictionary = NSDictionary(object: UIColor.white,forKey: NSForegroundColorAttributeName as NSCopying)
        self.navigationController?.navigationBar.titleTextAttributes = navigationTitleAttribute as? [String : AnyObject]
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) && animated == true{
            self.interactivePopGestureRecognizer?.isEnabled = false
        }
        
        if (self.viewControllers.count > 0) {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

}
