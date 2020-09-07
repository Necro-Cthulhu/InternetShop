//
//  ViewController.swift
//  InternetShop
//
//  Created by Никита Груздев on 04.08.2020.
//  Copyright © 2020 Никита Груздев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let idCell = "Cell"
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    var products = [Product]()
    
    override func viewDidLoad() {
        
        if tableViewOutlet == nil {
            return
        }
        
        // parse method
        
        func parse() {
            let url = Bundle.main.url(forResource: "products", withExtension: "json")
            if let url = url
            {
                let data = try? Data(contentsOf: url)
                do {
                    guard let data = data
                        else { return }
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                    let productsArray = json?.value(forKey: "productsList") as! NSArray
                    
                    
                    for arrayData in productsArray {
                        
                        let productData = arrayData as! [String:Any]
                        
                        let product = Product(id: productData["id"] as? String ?? "",
                                              name: productData["name"] as? String ?? "",
                                              price: productData["price"] as? String ?? "",
                                              description: productData["description"] as? String ?? "")
                        
                        products.append(product)
                    }
                }
                    
                catch let error as NSError
                {
                    print(error.localizedDescription)
                }
                
            }
        }
        
        super.viewDidLoad()
        parse()
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
        
        cell.textLabel?.text = products[indexPath.row].name
        cell.detailTextLabel?.text = products[indexPath.row].price
        cell.imageView?.image = UIImage(named: products[indexPath.row].id)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailsController") as! SecondViewController
        navigationController?.pushViewController(detailsController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        detailsController.product = products[indexPath.row]
    }
}


