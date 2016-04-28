//
//  ViewController.swift
//  PromiseTest
//
//  Created by 孟辉 on 16/4/1.
//  Copyright © 2016年 孟辉. All rights reserved.
//

import UIKit
import Alamofire
import PromiseKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        SchoolGet("1011").responseWK(WKSchoolDetail).then ({ (schoolDetail) in
            print(schoolDetail.school.school_id)
        }).error{(err) in

        }
        
        
        UserLogin("15990013156", pasword: "123456").responseWK(WKUserDetail).then ({ userDetail in
          print(userDetail.user.nick)
          WKNetwork.token =  userDetail.token.token;
        }).error { (err) in
            print(err)
        }
        
        
        let request1 = SchoolGet("1011").responseWK(WKSchoolDetail)
        
        let request2 =  UserLogin("15990013156", pasword: "123456").responseWK(WKUserDetail)
        
        
         //2个请求都成功 才返回
        when(request1,request2).then ({ (schoolDetail, userDetail)  in
            
        }).error { (error) in
            
        }
         //1成功 后才返回2
        
        schootGet().then{ userDetail -> Promise<WKUserDetail> in
           return self.login()
        }.then { userDetail in
            print(userDetail.user.user_name)
        }.error { (error) in
            
        }
        */
        
         RequestGithub("menhui222").responseWK(WKGitHubUser).then ({ user in

            print(user.login)
        }).error { (err) in
            print(err)
        }

        RequestGithub("FengDeng").responseWK(WKGitHubUser).then ({ user in

            print(user.login)
        }).error { (err) in
            print(err)
        }
        
        let request1 = RequestGithub("menhui222").responseWK(WKGitHubUser)
        let request2 = RequestGithub("FengDeng").responseWK(WKGitHubUser)
         // 2个请求都成功 才返回
        when(request1,request2).then ({ (user1, user2)  in
            print(user1.login)
            print(user2.login)
        }).error { (error) in
            print(error)
                }
                //1成功 执行2
        self.requestGithub1().then ({ user -> Promise<WKGitHubUser> in
        
        return self.requestGithub2()
        
        }).then ({ user  in
            
        }).error { error in
            
        }

    }
    
    
    
    
    func  requestGithub1() -> Promise<WKGitHubUser>{
        return Promise{ success,error in  RequestGithub("menhui222").responseWK(WKGitHubUser).then ({ user in
            
           success(user)
        })
        
        }
    
    }
    func  requestGithub2() -> Promise<WKGitHubUser>{
        return Promise{ success,error in  RequestGithub("FengDeng").responseWK(WKGitHubUser).then ({ user in
            
            success(user)
        })
            
        }
        
    }
    /*
    func schootGet() -> Promise<WKSchoolDetail>{
     return  Promise{ success,failure  in  SchoolGet("1011").responseWK(WKSchoolDetail).then ({ (schoolDetail) in
            success(schoolDetail)
        })
    }
    }
    func login()->Promise<WKUserDetail>{
       return  Promise{ success,failure  in   UserLogin("15990013156", pasword: "123456").responseWK(WKUserDetail).then ({ userDetail in
            success(userDetail)
        })
     }
    }
    */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

