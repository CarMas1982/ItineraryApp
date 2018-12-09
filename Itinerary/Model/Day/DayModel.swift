//
//  DayModel.swift
//  Itinerary
//
//  Created by Carmine Massei on 01/12/2018.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import Foundation

struct DayModel {
    var id: String!
    var title = ""
    var subtitle = ""
    var activityModels = [ActivityModel]()
    
    init(title: String, subtitle: String, data: [ActivityModel]?) {
        id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        
        if let data = data {
            self.activityModels = data
        }
    }
}
