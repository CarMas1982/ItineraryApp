//
//  TripsViewController.swift
//  Itinerary
//
//  Created by Carmine Massei on 10/10/18.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController{
   
    

    @IBOutlet var tableView: UITableView!
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrips(completion: { [weak self] in
            // invocato quando il completion viene invocato
            self?.tableView.reloadData()
        })
        
        view.backgroundColor = Theme.backgroundColor
        addButton.createFloatingActionButton()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue" {
            let popup = segue.destination as! AddTripViewController
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
}

extension TripsViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Tableview Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TripsTableViewCell
        
        cell.setup(tripModel: Data.tripModels[indexPath.row])
        return cell
    }
    
    
    //MARK: - TableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let trip = Data.tripModels[indexPath.row]
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
            
            //aggiungiamo un alert con due azioni una per bottone
            let alert = UIAlertController(title: "Delete Trip", message: "Are you sure you want to delete this \(trip.title)?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
                actionPerformed(false)
            }))
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
                //Perform delete
                TripFunctions.deleteTrip(index: indexPath.row)
                //            tableView.reloadData() // così facendo l'eliminazione è troppo veloce
                
                //otteniamo l'effetto che all'atto del delete le celle scompaiono con una animazione
                tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerformed(true) //per far scomparire il Delete
            }))
            self.present(alert,animated: true)

        }
        delete.image = #imageLiteral(resourceName: "Delete")
//        delete.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
}
