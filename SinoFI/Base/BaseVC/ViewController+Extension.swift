//
//  ViewController+Extension.swift
//  SinoFI
//
//  Created by 刘 强 on 2017/2/22.
//  Copyright © 2017年 刘 强. All rights reserved.
//

import UIKit

extension UIViewController: UIGestureRecognizerDelegate {
    
    public func setNavBar(){
        let ges = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(edgePanGesture(edgePanGestureRecognizer:)))
        ges.delegate = self
        ges.edges = UIRectEdge.left
        self.view.addGestureRecognizer(ges)
        if UIDevice.IS_OS_7_OR_LATER() {
            self.navigationController?.navigationBar.barTintColor = UIColor.white
            self.navigationController?.navigationBar.tintColor = UIColor.white
            self.navigationController?.navigationBar.isTranslucent = false
        }else{
            self.navigationController?.navigationBar.tintColor = UIColor.white
        }
        
        guard self.navigationItem.leftBarButtonItem != nil else {
            return
        }
        
        if !(self.navigationController?.viewControllers[0] == self) {
            self.navigationItem.leftBarButtonItems = [self.addBackBtn()]
        }else{
//            self.addHomeBtn()//首页添加其他的按钮
        }
        
    }
   private func addBackBtn() -> UIBarButtonItem {
        var keyString = "UIViewControllerKEY"
        var backButtonItem = objc_getAssociatedObject(self, &keyString);
        if (backButtonItem == nil) {
           backButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(back))
            objc_setAssociatedObject(self, &keyString, backButtonItem, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return backButtonItem as! UIBarButtonItem
    }
    func edgePanGesture(edgePanGestureRecognizer :UIScreenEdgePanGestureRecognizer)
    {
        self.navigationController?.popViewController(animated: true)
    }
    func back()  {
        self.navigationController?.popViewController(animated: true)
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if ((self.navigationController != nil) && self.navigationController?.viewControllers.count == 1) {
            return false
        }
        return true
    }
    
}
