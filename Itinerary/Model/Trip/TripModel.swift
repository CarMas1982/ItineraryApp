//
//  TripModel.swift
//  Itinerary
//
//  Created by Carmine Massei on 10/10/18.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import Foundation

class TripModel {
    
    var id: String!
    var title: String!
    
    
    init(title: String) {
        id = UUID().uuidString //crea un id
        self.title = title
    }
    
}
