//
//  TripModel.swift
//  Itinerary
//
//  Created by Carmine Massei on 10/10/18.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import UIKit

struct TripModel {
    
    let id: UUID
    var title: String
    var image: UIImage?
    var dayModels = [DayModel]()
    
    
//    init(title: String, image: UIImage? = nil) {
//        id = UUID() //crea un id
//        self.title = title
//        self.image = image
//    }
    
    
    init(title: String, image: UIImage? = nil, dayModels: [DayModel]? = nil) {
        id = UUID() //crea un id
        self.title = title
        self.image = image

        if let dayModels = dayModels {
            self.dayModels = dayModels
        }
    }
    
}
