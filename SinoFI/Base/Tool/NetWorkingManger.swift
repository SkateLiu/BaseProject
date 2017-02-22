//
//  NetWorkingManger.swift
//  SinoFI
//
//  Created by 刘 强 on 2017/2/22.
//  Copyright © 2017年 刘 强. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetWorkingManger: NSObject {
    static let manger = NetWorkingManger()
    
    func GET(urlString: String, params : [String:Any], success : @escaping (_ response : JSON)->(), failture : @escaping (_ error : Error)->())  {
        self.request(method: .get, urlString: urlString, params: params, success: success, failture: failture)
    }
    func POST(urlString: String, params : [String:Any], success : @escaping (_ response : JSON)->(), failture : @escaping (_ error : Error)->())  {
        self.request(method: .post, urlString: urlString, params: params, success: success, failture: failture)
    }
    func DELETE(urlString: String, params : [String:Any], success : @escaping (_ response : JSON)->(), failture : @escaping (_ error : Error)->())  {
        self.request(method: .delete, urlString: urlString, params: params, success: success, failture: failture)
    }
    func PUT(urlString: String, params : [String:Any], success : @escaping (_ response : JSON)->(), failture : @escaping (_ error : Error)->())  {
        self.request(method: .put, urlString: urlString, params: params, success: success, failture: failture)
    }
    func UPLOAD(urlString : String, params:[String:Any], data: Data, name: String,success : @escaping (_ response : JSON)->(), failture : @escaping (_ error : Error)->())  {
        self.upLoadRequest(urlString: urlString, params: params, data: data, name: name, success: success, failture: failture)
    }
    
    
    
}
extension NetWorkingManger{
    
    fileprivate func request(method:HTTPMethod,urlString: String, params : [String : Any], success : @escaping (_ response : JSON)->(), failture : @escaping (_ error : Error)->()) {
        
        Alamofire.request(host + urlString, method: method, parameters: params)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    success(JSON(value))
                case .failure(let error):
                    failture(error)
                }
        }
        
    }
    fileprivate func upLoadRequest(urlString : String, params:[String:Any], data: Data, name: String,success : @escaping (_ response : JSON)->(), failture : @escaping (_ error : Error)->()){
        
        let headers = ["content-type":"multipart/form-data"]
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(data, withName: "file", fileName: name, mimeType: "image/png")
        },
            to: host + urlString,
            headers: headers,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if let value = response.result.value as? [String: AnyObject]{
                            success(JSON(value))
                        }
                    }
                case .failure(let encodingError):
                    failture(encodingError)
                }
        }
        )
    }
}
