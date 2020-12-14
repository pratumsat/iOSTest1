//
//  LoginViewModelType.swift
//  iOSTest
//
//  Created by thnawat on 14/12/2563 BE.
//

import Foundation

protocol LoginViewModelInput {
    func loginTaped(username:String , password:String)
}

protocol LoginViewModelOutput: class {
    var respondLogin : (RespondLogin) -> Void { get set }
   
}

protocol LoginViewModelType  {
    
    var input : LoginViewModelInput { get }
    var output : LoginViewModelOutput { get }
}
