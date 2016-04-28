//
//  WKNetworkManager.swift
//  PromiseTest
//
//  Created by 孟辉 on 16/4/14.
//  Copyright © 2016年 孟辉. All rights reserved.
//
import UIKit
import Alamofire
import PromiseKit
import SVProgressHUD

let WKNetwork = WKNetworkManager.shareManager


class WKNetworkManager {

    static let shareManager = WKNetworkManager()
    var kdomain = "https://api.github.com/"
    var token = ""
    private init(){
    
    }
    public func request(
        method: Alamofire.Method,
        _ URLString: URLStringConvertible,
          parameters: [String: AnyObject]? = nil,
          encoding: ParameterEncoding = .URL,
          headers: [String: String]? = nil)
        -> Promise<Request>
    {
        // 每个接口都要加token
//        var params : Dictionary<String,AnyObject>? = nil
//        if WKNetwork.token != ""{
//            params = ["token":WKNetwork.token].union(parameters)
//        }else{
//            params = parameters;
//        }
        //Alamofire 请求。。。。。
        return Promise{suc,err in
            suc(Alamofire.request(method,WKNetwork.kdomain + URLString.URLString, parameters: parameters, encoding: encoding, headers: headers))
        }
    }
}




extension Dictionary{
    //字典拼接
    func union(dic:Dictionary?)->Dictionary{
        var ret = self
        if let dic = dic{
            for (key,value) in dic{
                ret[key] = value
            }
        }
        return ret
    }
    
}
