//
//  SecondViewController.swift
//  InternetShop
//
//  Created by Никита Груздев on 04.08.2020.
//  Copyright © 2020 Никита Груздев. All rights reserved.
//

import UIKit


class SecondViewController: ViewController {
    
    @IBOutlet weak var priceLabelOutlet: UILabel!
    @IBOutlet weak var descriptionLabelOutlet: UILabel!
    @IBOutlet weak var nameLabelOutlet: UILabel!
    @IBOutlet weak var imageIdOutlet: UIImageView!
    @IBOutlet var tableViewTwo: UIView!
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabelOutlet.text = product?.name
        descriptionLabelOutlet.text = product?.description
        imageIdOutlet.image = UIImage(named: product!.id)
        priceLabelOutlet.text = product?.price
    }
}
