//
//  ActivityModel.swift
//  Itinerary
//
//  Created by Carmine Massei on 01/12/2018.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import Foundation
import UIKit

struct ActivityModel {
    var id: String!
    var title = ""
    var subtitle = ""
    var activityType: ActivityType
    var photo: UIImage?
    
    init(title: String, subtitle: String, activityType: ActivityType, photo: UIImage? = nil ) {
        self.title = title
        self.subtitle = subtitle
        self.activityType = activityType
        self.photo = photo
    }
}
