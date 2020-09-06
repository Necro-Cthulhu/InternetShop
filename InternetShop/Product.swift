//
//  Product.swift
//  InternetShop
//
//  Created by Никита Груздев on 05.08.2020.
//  Copyright © 2020 Никита Груздев. All rights reserved.
//

class Product {
    let id: String
    let name: String
    let price: String
    let description: String
    
    init(id: String, name: String, price: String, description: String) {
        self.description = description
        self.id = id
        self.name = name
        self.price = price
    }
}

