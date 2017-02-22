//
//  MainTabBarController.swift
//  CarelinkerEnterprise
//
//  Created by 刘 强 on 16/10/19.
//  Copyright © 2016年 carelinker. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        let vc1 = HomePageMainVC()
//        let nav1 = MainNavigationController(rootViewController: vc1)
//        nav1.navigationBar.setBackgroundImage(UIImage(named: "NavBarBg"), for: UIBarMetrics.default)
//        vc1.tabBarItem = TabBarItem(imageName: "TabHomePage", title: TextConstants.SHOU_YE)
//        
//        let vc2 = MemberMainVC()
//        let nav2 = MainNavigationController(rootViewController: vc2)
//        nav2.navigationBar.setBackgroundImage(UIImage(named: "NavBarBg"), for: UIBarMetrics.default)
//        vc2.tabBarItem = TabBarItem(imageName: "TabPatient", title: TextConstants.HUI_YUAN)
//        
//        let vc3 = KnowledgeHomeVC2()
//        let nav3 = MainNavigationController(rootViewController: vc3)
//        nav3.navigationBar.setBackgroundImage(UIImage(named: "NavBarBg"), for: UIBarMetrics.default)
//        vc3.tabBarItem = TabBarItem(imageName: "TabKnowledge", title: TextConstants.ZHI_SHI)
//        
//        let vc4 = UMCommunity.getFeedsModalViewController()
//        vc4?.tabBarItem = TabBarItem(imageName: "TabCommunity", title: TextConstants.SHE_QU)
//        
//        let vc5 = MeMainVC()
//        let nav5 = MainNavigationController(rootViewController: vc5)
//        nav5.navigationBar.setBackgroundImage(UIImage(named: "NavBarBg"), for: UIBarMetrics.default)
//        vc5.tabBarItem = TabBarItem(imageName: "TabMe", title: TextConstants.WO)
//        self.tabBar.tintColor = UIColor.colorBlueDefault()
//        self.tabBar.barTintColor = UIColor.white
//        self.viewControllers = [nav1 , nav2, nav3, vc4!, nav5]
    }


}
class TabBarItem: UITabBarItem {
    override init() {
        super.init()
        self.image = self.image?.withRenderingMode(.alwaysOriginal)
        self.selectedImage = self.selectedImage?.withRenderingMode(.alwaysOriginal)
        self.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.darkGray], for: .normal)
        self.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.white], for: .selected)
    }

    init(imageName:String?,title:String?) {
        super.init()
        self.image = UIImage(named: imageName!)
        self.selectedImage = UIImage(named: imageName!+"Pre")
        self.title = title
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
