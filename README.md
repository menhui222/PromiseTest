# PromiseTest
基于PromiseKit ,Alamofire写的网络请求

#### Example

###### 单个请求
     RequestGithub("menhui222").responseWK(WKGitHubUser).then ({ user in

            print(user.login)
        }).error { (err) in
            print(err)
        }
        
        
        
###### 请求并行
        let request1 = RequestGithub("menhui222").responseWK(WKGitHubUser)
        let request2 = RequestGithub("FengDeng").responseWK(WKGitHubUser)
         // 2个请求都成功 才返回
        when(request1,request2).then ({ (user1, user2)  in
            print(user1.login)
            print(user2.login)
        }).error { (error) in
            print(error)
                }
###### 请求嵌套
        //1成功 执行2
        self.requestGithub1().then ({ user -> Promise<WKGitHubUser> in
        
        return self.requestGithub2()
        
        }).then ({ user  in
            
        }).error { error in
            
        }
        
        感谢 PromiseKit ,Alamofire 提供开源框架0。0