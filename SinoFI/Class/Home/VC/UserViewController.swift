//
//  UserViewController.swift
//  SinoFI
//
//  Created by 刘 强 on 2017/2/22.
//  Copyright © 2017年 刘 强. All rights reserved.
//

import UIKit

class UserViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton(type: UIButtonType.contactAdd)
        btn.addTarget(self, action: #selector(UserViewController.add(btn:)), for: UIControlEvents.touchDown)
        view.addSubview(btn)
        btn.frame = CGRect(x: 0, y: 100, w: 100, h: 100)
    }
    func add(btn:UIButton)  {
        btn.isSelected = !btn.isSelected
        if btn.isSelected {
            MainHUD.shared.show()
        }else{
            MainHUD.shared.stop()
            pushTo(ViewControllerTest())
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
