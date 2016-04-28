//
//  Alamofire+Extension.swift
//  PromiseTest
//
//  Created by 孟辉 on 16/4/14.
//  Copyright © 2016年 孟辉. All rights reserved.
//

import UIKit
import Alamofire
import PromiseKit
import SVProgressHUD
// MARK: - extension Request
extension Request{
    /**
     处理 数据错误
     
     - returns: 得到的还是json
     */
    func requestWK() -> Promise<AnyObject> {
        
        return Promise{success,failure in
            self.responseJSON(completionHandler: { (response) in
                if let error = response.result.error {
                    failure(error)
                    print(error)
                    return
                }
                guard let json = response.result.value else{
                    failure(NSError(domain: "返回的JSON为nil", code: -1, userInfo: nil))
                    return
                }
                guard let JSON = json as? Dictionary<String,AnyObject> else{
                    failure(NSError(domain: "返回的JSON格式不正确", code: -1, userInfo: nil))
                    return
                }
                print(JSON)
                /* 下面额外接口格式对判断
                guard let error_no = JSON["error_no"] as? Int else{
                    failure(NSError(domain: "返回的JSON格式不正确", code: -1, userInfo: nil))
                    return
                }
                
                if error_no != 200{
                    failure(NSError(domain:((JSON["error_msg"] ?? "error_msg为nil") as? String) ?? "error_msg为nil" , code: error_no, userInfo: nil))
                    return
                }
                
                guard let result = JSON["result"] else{
                    failure(NSError(domain: "result为nil", code: error_no, userInfo: nil))
                    return
                }
                */
                success(JSON)

            })
        }
    }
    /**
     模型数据解析  传进去model的类型 必须符合WKJSONConvertType 协议的都可以解析
     
     - parameter classModel: 解析返回model
     
     - returns: 返回结果model
     */
    func requestWK<H:WKJSONConvertType>(classModel:H.Type) ->Promise<H>{
    return self.requestWK().then({ (json) -> Promise<H> in
        return Promise{ success,failure in
            do {
                let  h = try classModel.from(json)
                success(h);
            }catch{
            failure(error)
            }
        }
    })
    
    }
}
