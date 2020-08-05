//
//  SecondViewController.swift
//  InternetShop
//
//  Created by Никита Груздев on 04.08.2020.
//  Copyright © 2020 Никита Груздев. All rights reserved.
//

import UIKit


class SecondViewController: ViewController {
    
    @IBOutlet var tableViewTwo: UIView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let secondViewController = segue.destination as! SecondViewController
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            self.performSegue(withIdentifier: "segueOne", sender: self)
        }
    }
}
