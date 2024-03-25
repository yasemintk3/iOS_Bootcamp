//
//  Buttons.swift
//  Odev6ListingInterface
//
//  Created by Yasemin TOK on 24.03.2024.
//

import Foundation

class Buttons {
 
    var id:Int?
    var name:String?
    var image:String?
    
    init() {
        
    }
    
    init(id: Int, name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
}
