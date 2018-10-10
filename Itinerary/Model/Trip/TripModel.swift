//
//  TripModel.swift
//  Itinerary
//
//  Created by Carmine Massei on 10/10/18.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import Foundation

class TripModel {
    
    let id: UUID
    var title: String
    
    
    init(title: String) {
        id = UUID() //crea un id
        self.title = title
    }
    
}
