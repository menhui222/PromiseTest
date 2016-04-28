//
//  WKNetWorkProtocol.swift
//  PromiseTest
//
//  Created by 孟辉 on 16/4/14.
//  Copyright © 2016年 孟辉. All rights reserved.
//

import UIKit

public protocol WKJSONConvertType{
    //从JSON转化
    static func from(json:AnyObject) throws -> Self
}
func autocast<T>(x: Any) -> T {
    return x as! T
}