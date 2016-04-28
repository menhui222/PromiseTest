//
//  WKNetWorkConfig.swift
//  PromiseTest
//
//  Created by 孟辉 on 16/4/14.
//  Copyright © 2016年 孟辉. All rights reserved.
//
import Foundation
import Alamofire
import PromiseKit


/**
 登录
 
 - parameter userName: 帐号
 - parameter pasword:  密码
 
 - returns: Promise
 */
let  wk_APIURLUserLogin       =  "user/login/"
let  wk_APIKEYLoginName       =  "loginname"
let  wk_APIKEYPassword        =  "password"
let  wk_APIKEYDeviceToken     =  "device_token"
let  wk_APIKEYSourceDevice    =  "source_device"
let  wk_APIKEYAppType         =  "app_type"


func UserLogin(userName:String,pasword:String) -> Promise<Request> {
    return WKNetwork.request(.POST, wk_APIURLUserLogin, parameters: [wk_APIKEYLoginName:userName,wk_APIKEYPassword:pasword,wk_APIKEYDeviceToken:"123",wk_APIKEYSourceDevice:"app",wk_APIKEYAppType:"测试"])
}
/**
 获取校区
 
 - parameter school_id: 校区id
 
 - returns: Promise
 */

let  wk_APIURLGetSchool = "school/get/"
let  wk_APIKEYSchoolId  = "school_id"

func SchoolGet(school_id:String) -> Promise<Request> {
    return WKNetwork.request(.POST, wk_APIURLGetSchool, parameters: [wk_APIKEYSchoolId:school_id])
}

let wk_APIURLUsersGet = "users/"
func RequestGithub(userName:String)-> Promise<Request>{
    return WKNetwork.request(.GET, wk_APIURLUsersGet + userName)
}




