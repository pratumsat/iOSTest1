//
//  DetailViewModelType.swift
//  iOSTest
//
//  Created by thnawat on 14/12/2563 BE.
//

import Foundation

protocol DetailViewModelInput {
    func viewDidLoad(customerId:String?)
}

protocol DetailViewModelOutput : class {
    var respondDetail: (RespondCustomerDetail)  -> Void { get set }

}

protocol DetailViewModelType {
    var input : DetailViewModelInput { get }
    var output : DetailViewModelOutput { get }
}
