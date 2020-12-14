//
//  LoginViewModel.swift
//  iOSTest
//
//  Created by thnawat on 14/12/2563 BE.
//

import Foundation

class LoginViewModel : LoginViewModelType , LoginViewModelInput , LoginViewModelOutput{
    

    func loginTaped(username: String, password: String) {
        let requestLogin = RequestLogin(username: username, password: password)
        LoginApi().callService(request: requestLogin, { [unowned self] respondUser in
            self.respondLogin(respondUser)
            DataController.setToken(token: respondUser.token ?? "")
            
        })
    }
    
    var respondLogin: (RespondLogin) -> Void = {_ in }
    
    var input: LoginViewModelInput { return  self }
    
    var output: LoginViewModelOutput { return self }
    
    
}
