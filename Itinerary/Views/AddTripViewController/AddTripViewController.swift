//
//  AddTripViewController.swift
//  Itinerary
//
//  Created by Carmine Massei on 16/10/18.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var tripTextField: UITextField!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    
    var doneSaving: (() -> ())? //callback function
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        
        guard tripTextField.text != "", let newTripName = tripTextField.text else {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
            imageView.image = #imageLiteral(resourceName: "warning") //image literal
            imageView.contentMode = .scaleAspectFit
            tripTextField.rightView = imageView
            
            
            
            //Alternative
            //1: usare un color literal per evidenziare il text field
//            tripTextField.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            
            //2: colorare il bordo, arrotondare i bordi del text field e modificare il placeholder text
            tripTextField.layer.borderColor = UIColor.red.cgColor
            tripTextField.layer.borderWidth = 1
            tripTextField.layer.cornerRadius = 5
            tripTextField.placeholder = "Trip name required"
            
            tripTextField.rightViewMode = .always
            return
            
        }
        
        //Salvataggio dei dati
        TripFunctions.createTrip(tripModel: TripModel(title: newTripName))
        
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
    
    

}
