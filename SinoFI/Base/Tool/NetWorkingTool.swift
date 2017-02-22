//
//  NetWorkingTool.swift
//  SinoFI
//
//  Created by 刘 强 on 2017/2/22.
//  Copyright © 2017年 刘 强. All rights reserved.
//

import UIKit
import SwiftyJSON
class NetWorkingTool: NSObject {
    static let shared = NetWorkingTool()
    let manger = NetWorkingManger.manger
    /**
     示例代码
     中间层调用底层NetWorkingManger的代码
     成功block模型统一在SwiftyJSON+Extension中处理
     error统一在NetWorkingManger处理 特殊要求可在控制器处理
     */
    func login(userName:String,pwd:String,successBlock:@escaping (UserModel)->(),error:@escaping ()->()) {
        var params = [String:Any]()
        params.updateValue(userName, forKey: "userName")
        params.updateValue(pwd, forKey: "pwd")
        manger.GET(urlString: loginUrl, params: params, success: { (json) in
            successBlock(json.toUserModel())
        }) { (erorT) in
            error()
        }
    }
    
}
