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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: idCell)
        
        cell.detailTextLabel?.text = "Цена товара..."
        cell.textLabel?.text = "Название товара..."
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueOne", sender: self)
    }
}
