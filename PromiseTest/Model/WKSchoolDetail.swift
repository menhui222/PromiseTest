//
//  WKSchoolDetail.swift
//  PromiseTest
//
//  Created by 孟辉 on 16/4/25.
//  Copyright © 2016年 孟辉. All rights reserved.
//

import UIKit


class School: NSObject {
     var school_id = ""
     var name      = ""
     var address   = ""
     var email     = ""
     var in_url    = ""
     var out_url   = ""
     var picture   = ""
}

class WKSchoolDetail: NSObject {

    var school = School()
    
   
}


extension WKSchoolDetail :WKJSONConvertType{

    static func from(json: AnyObject) throws -> Self {
        guard let user = self.mj_objectWithKeyValues(json) else{
            throw NSError(domain: "json转化模型失败，模型为nil", code: -1, userInfo: nil)
        }
        return autocast(user)
    }
}