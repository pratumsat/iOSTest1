//
//  DetailViewController.swift
//  iOSTest
//
//  Created by thnawat on 14/12/2563 BE.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var customerGradeLabel: UILabel!
    @IBOutlet weak var isCustomerPremiumLabel: UILabel!
    
    
     let viewModel = DetailViewModel()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        viewModel.output.respondDetail = { respondDetail in
            if let data = respondDetail.data {
                self.idLabel.text = data.id
                self.nameLabel.text = data.name
                self.sexLabel.text = data.sex
                self.customerGradeLabel.text = data.customerGrade
                self.isCustomerPremiumLabel.text = "\(data.isCustomerPremium!)"
            }
           
        }
        viewModel.input.viewDidLoad(customerId: viewModel.customerId)
        
       
    }
    
 
}
