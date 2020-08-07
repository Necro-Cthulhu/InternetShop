//
//  ViewController.swift
//  InternetShop
//
//  Created by Никита Груздев on 04.08.2020.
//  Copyright © 2020 Никита Груздев. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    let idCell = "Cell"
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        
        if tableViewOutlet == nil {
            return
        }
        super.viewDidLoad()
        tableViewOutlet?.dataSource = self
        tableViewOutlet.delegate = self
        }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: idCell)
        
        let product = products[indexPath.row]
        
        cell.textLabel?.text = product.name              // в TableView выводится название и цена
        cell.detailTextLabel?.text = product.price
        cell.imageView?.image = UIImage(named: product.id)    // в TableView выводится изображение товара
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    
    
    
  /*  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let product = products[indexPath.row]
        let detailsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailsController") as! SecondViewController
        detailsController.product = product
        navigationController?.pushViewController(detailsController, animated: true)
    }
  */
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueOne", sender: self)
        
    }
  
    
}
