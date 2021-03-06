//
//  AddTripViewController.swift
//  Itinerary
//
//  Created by Carmine Massei on 16/10/18.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import UIKit
import Photos

class AddTripViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var tripTextField: UITextField!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var imageView: UIImageView!
    
    var doneSaving: (() -> ())? //callback function
    var tripIndexToEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        imageView.layer.cornerRadius = 10
        
        //Dropshadow on title
        titleLabel.layer.shadowOpacity = 1
        titleLabel.layer.shadowColor = UIColor.white.cgColor
        titleLabel.layer.shadowOffset = CGSize.zero
        titleLabel.layer.shadowRadius = 5
        
        if let index = tripIndexToEdit {
            let trip = Data.tripModels[index]
            tripTextField.text = trip.title
            imageView.image = trip.image
            titleLabel.text = "Edit Trip" //Label del popup modificata in Edit quando siamo nella funzione di editing!!
        }
        
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
        
        if let index = tripIndexToEdit {
            TripFunctions.updateTrip(at: index, title: newTripName, image: imageView.image)
        } else {
            TripFunctions.createTrip(tripModel: TripModel(title: newTripName, image: imageView.image))
        }
        
        //Salvataggio dei dati
        
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
    
    
    fileprivate func presentPhotoPicker() {
        let myPickerController = UIImagePickerController()
        myPickerController.allowsEditing = true
        myPickerController.delegate = self
        myPickerController.sourceType = .photoLibrary
        self.present(myPickerController,animated: true)
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        
        // eseguo il controllo per vedere se la photoLibrary non è vuota, questo non serve più a partire da iOS11
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                    self.presentPhotoPicker()
                case .notDetermined:
                    if status == PHAuthorizationStatus.authorized {
                        self.presentPhotoPicker()
                    }
                case .restricted:
                    let alert = UIAlertController(title: "Photo Library Restricted", message: "Photo library access is restricted and cannot be accessed", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(okAction)
                    self.present(alert,animated: true)
                case .denied:
                    let alert = UIAlertController(title: "Photo Library Access Denied", message: "Photo library access previously denied. Please update your Settings if you wish to change this.", preferredStyle: .alert)
                    let gotoSettingsAction = UIAlertAction(title: "Go to Settings", style: .default) { (action) in
                        DispatchQueue.main.async {
                            if let url = URL(string: UIApplication.openSettingsURLString) {
                                UIApplication.shared.open(url, options: [:])
                            }
                        }
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                    
                    alert.addAction(gotoSettingsAction)
                    alert.addAction(cancelAction)
                    self.present(alert,animated: true)
                }
            }
//        }
    }
}

extension AddTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // inserendo il primo if faccio in modo che venga usata l'immagine su ridimensionata
        if let image = info[.editedImage] as? UIImage {
             self.imageView.image = image
        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = image
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
