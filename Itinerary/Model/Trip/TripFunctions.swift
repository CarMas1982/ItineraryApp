//
//  TripFunctions.swift
//  Itinerary
//
//  Created by Carmine Massei on 10/10/18.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import Foundation

class TripFunctions {
     //mettendo static posso accedere alla funzione senza dover instanziare ogni volta la classe
    
    static func createTrip(tripModel: TripModel){
        
    }
    
    static func readTrips(){
        if Data.tripModels.count == 0 {
            Data.tripModels.append(TripModel(title: "Trip to Bali"))
            Data.tripModels.append(TripModel(title: "Mexico"))
            Data.tripModels.append(TripModel(title: "Russian Trip"))
        }
    }
    
    static func updateTrip(tripModel: TripModel){
        
    }
    
    
    static func deleteTrip(tripModel: TripModel){
        
    }
    
    
}
