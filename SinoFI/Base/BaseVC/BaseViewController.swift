//
//  BaseViewController.swift
//  SinoFI
//
//  Created by 刘 强 on 2017/2/22.
//  Copyright © 2017年 刘 强. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class BaseViewController: UIViewController {

    var popVCClass: AnyClass!

    /// 标记是否是模态进入控制器 如果是 back()时以dissmiss方式销毁
    var isPresentIngControl = false
    
    var action:((UIBarButtonItem)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.setNavBar()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func removeBackNavAndShowTabBar(){
        self.navigationItem.leftBarButtonItem = nil
        self.tabBarController?.tabBar.isHidden = false
    }
    override func back(){
        if self.isPresentIngControl == true {
            self.dismiss(animated: true, completion: {
                
            })
        }else if(self.popVCClass != nil){
            for vc in self.navigationController!.viewControllers{
                if(vc.isKind(of: self.popVCClass)){
                    self.navigationController!.popToViewController(vc, animated: true)
                }
            }
        }else{
            self.navigationController!.popViewController(animated: true)
        }
    }
    func pushTo(_ viewController: UIViewController){
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
extension BaseViewController:NVActivityIndicatorViewable{
    
    func showMessage(message:String)  {
        startAnimating(CGSize(width: 100, height:100), message: message, messageFont: UIFont.systemFont(ofSize: 14), type: NVActivityIndicatorType.lineScale, color: UIColor.white, padding: 10, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: UIColor.init(red: 66, green: 66, blue: 66), textColor: UIColor.black)
    }
    func showNomalMessage(message:String)  {
        NVActivityIndicatorPresenter.sharedInstance.setMessage(message)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            self.hideHUD()
        }
    }
    func hideHUD()  {
        stopAnimating()
    }

}
