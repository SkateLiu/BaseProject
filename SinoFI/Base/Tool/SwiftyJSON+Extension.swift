//
//  SwiftyJSON+Extension.swift
//  SinoFI
//
//  Created by 刘 强 on 2017/2/22.
//  Copyright © 2017年 刘 强. All rights reserved.
//

                                                /**- 所有转模型操作在此处*/
import SwiftyJSON

extension JSON {
    func toUserModel() -> UserModel{
        let model = UserModel()
        model.name = self["name"].stringValue
        model.age = self["age"].intValue
        model.smokIng = self["name"].boolValue
        return model
    }
    
}
