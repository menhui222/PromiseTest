//
//  Promise+Extension.swift
//  PromiseTest
//
//  Created by 孟辉 on 16/4/14.
//  Copyright © 2016年 孟辉. All rights reserved.
//

import UIKit
import PromiseKit
import Alamofire


extension Promise where T : Request {
    /**
      模型数据解析  传进去model的类型 必须符合WKJSONConvertType 协议的都可以解析
     
     - parameter classModel: 解析返回model
     
     - returns: 返回结果classModel
     */
    func responseWK<H:WKJSONConvertType>(modelClass:H.Type) -> Promise<H> {
        return self.then({ (request) -> Promise<H> in
            return request.requestWK(modelClass)
        })
    }

}
