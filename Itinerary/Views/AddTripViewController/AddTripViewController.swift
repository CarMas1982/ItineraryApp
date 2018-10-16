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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    

}
