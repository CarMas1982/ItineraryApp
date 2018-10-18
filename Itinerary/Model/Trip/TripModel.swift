//
//  TripModel.swift
//  Itinerary
//
//  Created by Carmine Massei on 10/10/18.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import UIKit

class TripModel {
    
    let id: UUID
    var title: String
    var image: UIImage?
    
    
    init(title: String, image: UIImage? = nil) {
        id = UUID() //crea un id
        self.title = title
        self.image = image
    }
    
}
