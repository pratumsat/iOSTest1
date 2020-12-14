//
//  LoginViewController.swift
//  iOSTest
//
//  Created by thnawat on 14/12/2563 BE.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBAction func LoginUnwindAction(unwindSegue: UIStoryboardSegue) {}
    
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.output.respondLogin = { [unowned self]  respondLogin in
            self.performSegue(withIdentifier: "dashboad", sender: respondLogin.customers)
        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        viewModel.input.loginTaped(username: usernameLabel.text!, password: passwordLabel.text!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dashboad" {
            let vc = segue.destination as! DashBoardNav
            vc.customers = sender as? [Customers]
        }
    }
    
    
}
