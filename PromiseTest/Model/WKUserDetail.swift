//
//  WKUserDetail.swift
//  PromiseTest
//
//  Created by 孟辉 on 16/4/14.
//  Copyright © 2016年 孟辉. All rights reserved.
//

import UIKit
import MJExtension

class WKUserDetail: NSObject ,WKJSONConvertType{
    var user = User()
    var sex = Sex()
    var token = Token()
    var userType = UserType()
    var subjects = [Subject]()
    var subject = Subject()
    override static func mj_objectClassInArray() -> [NSObject : AnyObject]! {
        return ["subjects":Subject.self]
    }
    
    static func from(json: AnyObject) throws -> Self {
        guard let user = WKUserDetail.mj_objectWithKeyValues(json) else{
            throw NSError(domain: "json转化模型失败，模型为nil", code: -1, userInfo: nil)
        }
        return autocast(user)
    }
}
class User : NSObject{
    var birthday = 0
    var user_name = ""
    var school_id = ""
    var nick = ""
    var avatar = ""
    var uid = ""
    var email = ""
    var mobile = ""
    var qq = ""
}

class Token : NSObject{
    var token = ""
}

class Sex : WKModel{}
class UserType : WKModel{}
class Subject : WKModel{}
