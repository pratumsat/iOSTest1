//
//  DetailViewModel.swift
//  iOSTest
//
//  Created by thnawat on 14/12/2563 BE.
//

import Foundation

class DetailViewModel : DetailViewModelType , DetailViewModelInput , DetailViewModelOutput {
   
    
    var customerId:String?
    
    func viewDidLoad(customerId: String?) {
        print(DataController.token)
        let request = RequestCustomerDetail(token: DataController.token, customerId: customerId)
        CustomerDetailApi().callService(request: request) { respondCustomerDetail in
            self.respondDetail(respondCustomerDetail)
        }
    }
    
    var respondDetail: (RespondCustomerDetail) -> Void = { _ in }
    
    var input: DetailViewModelInput { return self }
    
    var output: DetailViewModelOutput { return self }
    
    
}
