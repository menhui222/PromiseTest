//
//  WKGitHubUser.swift
//  PromiseTest
//
//  Created by 孟辉 on 16/4/25.
//  Copyright © 2016年 孟辉. All rights reserved.
//

import UIKit
// 因解析用的是mj 最好把解析库换了  就可以用struct  不用继承NSObject
class WKGitHubUser: NSObject {
  var  login = ""
  var  id = ""
  var  avatar_url = ""
  var  gravatar_id = ""
  var  url = ""
  var  html_url = ""
  var  followers_url = ""
  var  following_url = ""
  var  gists_url = ""
   var starred_url = ""
   var subscriptions_url = ""
   var organizations_url = ""
   var repos_url = ""
   var events_url = ""
   var received_events_url = ""
   var type = ""
   var site_admin = ""
   var name = ""
   var company = ""
   var blog = ""
   var location = ""
   var email = ""
   var hireable = ""
   var bio = ""
   var public_repos = ""
   var public_gists = ""
   var followers = ""
   var following = ""
   var created_at = ""
   var updated_at = ""
}


extension WKGitHubUser :WKJSONConvertType{
    
    static func from(json: AnyObject) throws -> Self {
        guard let user = self.mj_objectWithKeyValues(json) else{
            throw NSError(domain: "json转化模型失败，模型为nil", code: -1, userInfo: nil)
        }
        return autocast(user)
    }
}