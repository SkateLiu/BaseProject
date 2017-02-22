//
//  MainHUD.swift
//  NVActivityIndicatorView
//
//  Created by 刘 强 on 2017/2/22.
//  Copyright © 2017年 Vinh Nguyen. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension MainHUD{
    public func show() {
        showT()
    }
    public func stop(){
        stopT()
    }
}

class MainHUD: UIView {
    static let shared  = MainHUD()
    fileprivate let indicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: screenW*0.2, height: screenW*0.2 ), type: NVActivityIndicatorType.lineScale, color: UIColor.white, padding: 20)
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: screenW*0.4, y: (screenH - screenW*0.2)*0.5, width: screenW*0.2, height: screenW*0.2))
        self.addSubview(indicatorView)
        self.backgroundColor = UIColor.init(red: 66, green: 66, blue: 66)
        self.setCornerRadius(radius: 5)
    }
    
    fileprivate func showT()  {
        self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        self.alpha = 1
        UIApplication.shared.keyWindow?.addSubview(self)
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 8, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }) { (_) in
            self.indicatorView.startAnimating()
        }
        
    }
    fileprivate func stopT()  {
        UIView.animate(withDuration: 0.25, animations: { 
            self.alpha = 0
        }) { (stop) in
            self.removeFromSuperview()
            self.indicatorView.stopAnimating()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

