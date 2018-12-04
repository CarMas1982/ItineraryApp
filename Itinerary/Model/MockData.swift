//
//  MockData.swift
//  Itinerary
//
//  Created by Carmine Massei on 01/12/2018.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import Foundation
import  UIKit

class MockData {
    static func createMockTripModelData() -> [TripModel] {
        var mockTrips = [TripModel]()
        mockTrips.append(TripModel(title: "Trip to Bali", image: #imageLiteral(resourceName: "bali"), dayModels: createMockDayModelData())) //con immagine
        mockTrips.append(TripModel(title: "Trip to Mexico", image: #imageLiteral(resourceName: "messico"), dayModels: createMockDayModelData()))
        mockTrips.append(TripModel(title: "Trip to Russia")) //senza immagine
        return mockTrips
    }
    
    
    static func createMockDayModelData() -> [DayModel] {
        var dayModels = [DayModel]()
        dayModels.append(DayModel(title: "April 18", subtitle: "Partenza", data: createMockActivityModelData(sectionTitle: "April 18")))
        dayModels.append(DayModel(title: "April 19", subtitle: "Arrivo", data: createMockActivityModelData(sectionTitle: "April 19")))
        dayModels.append(DayModel(title: "April 20", subtitle: "Escursione", data: createMockActivityModelData(sectionTitle: "April 20")))
        dayModels.append(DayModel(title: "April 21", subtitle: "Bar", data: createMockActivityModelData(sectionTitle: "April 21")))
        dayModels.append(DayModel(title: "April 22", subtitle: "Mare", data: createMockActivityModelData(sectionTitle: "April 22")))
        return dayModels
    }
    
    static func createMockActivityModelData(sectionTitle: String) -> [ActivityModel] {
        var activityModel = [ActivityModel]()
        activityModel.append(ActivityModel(title: "Titolo1", subtitle: "Sottotitolo1", activityType: .flight))
        activityModel.append(ActivityModel(title: "Titolo2", subtitle: "Sottotitolo2", activityType: .auto))
        activityModel.append(ActivityModel(title: "Titolo3", subtitle: "Sottotitolo3", activityType: .excursion))
        activityModel.append(ActivityModel(title: "Titolo4", subtitle: "Sottotitolo4", activityType: .food))
        activityModel.append(ActivityModel(title: "Titolo5", subtitle: "Sottotitolo5", activityType: .hotel))
        
        return activityModel
        
    }
}
