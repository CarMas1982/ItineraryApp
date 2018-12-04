//
//  TripFunctions.swift
//  Itinerary
//
//  Created by Carmine Massei on 10/10/18.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import UIKit

class TripFunctions {
     //mettendo static posso accedere alla funzione senza dover instanziare ogni volta la classe
    
    static func createTrip(tripModel: TripModel){
        Data.tripModels.append(tripModel)
    }
    
    static func readTrips(completion: @escaping () -> ()){
        
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
//                Data.tripModels.append(TripModel(title: "Trip to Bali"))
//                Data.tripModels.append(TripModel(title: "Mexico"))
//                Data.tripModels.append(TripModel(title: "Russian Trip"))
                Data.tripModels = MockData.createMockTripModelData()
            }
        }
        
        DispatchQueue.main.async {
            completion()
        }
    }
    
    static func updateTrip(at index: Int, title: String, image: UIImage? = nil){
        Data.tripModels[index].title = title
        Data.tripModels[index].image = image
    }
    
    
    static func deleteTrip(index: Int){
        Data.tripModels.remove(at: index)
    }
    
    static func readTrip(by id: UUID, completion: @escaping (TripModel?)->()) {
        DispatchQueue.global(qos: .userInitiated).async {
            let trip = Data.tripModels.first(where: { $0.id == id})
            
            DispatchQueue.main.async {
                completion(trip)
            }
        }
    }
    
    
}
