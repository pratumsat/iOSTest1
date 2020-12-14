//
//  DashboardViewController.swift
//  iOSTest
//
//  Created by thnawat on 14/12/2563 BE.
//

import UIKit

class DashboardViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
   

    @IBOutlet weak var tableView: UITableView!
    var customers:[Customers]?
    override func viewDidLoad() {
        super.viewDidLoad()

        customers = (self.navigationController as! DashBoardNav).customers
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
  
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customercell", for: indexPath) as! CustomerCell
        if let customer = self.customers?[indexPath.row] {
            cell.idLabel.text = customer.id
            cell.nameLabel.text = customer.name
        }
       
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let customerId = self.customers?[indexPath.row].id {
            self.performSegue(withIdentifier: "detail", sender: customerId)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let vc = segue.destination as! DetailViewController
            vc.viewModel.customerId = (sender as! String)
        }
    }
}
