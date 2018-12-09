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
    @IBOutlet var helpView: UIVisualEffectView!
    
    var tripIndexToEdit: Int?
    var seenHelpView = "seenTripHelp"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrips(completion: { [unowned self] in
            // invocato quando il completion viene invocato
            self.tableView.reloadData()
            
            //in questo modo vedo l'help solo se ci sono dati
            if Data.tripModels.count > 0 {
                if UserDefaults.standard.bool(forKey: self.seenHelpView) == false{
                    self.view.addSubview(self.helpView)
                    self.helpView.frame = self.view.frame
                }
            }
        })
        
        
        
        view.backgroundColor = Theme.backgroundColor
        addButton.createFloatingActionButton()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue" {
            let popup = segue.destination as! AddTripViewController
            popup.tripIndexToEdit = self.tripIndexToEdit
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
            
            // Reset the tripIndexToEdit in our TripsViewController before the popup opens. If we don't set tripIndexToEdit back to nil then the popup will always think you want to edit when you try to ADD a new trip.
            tripIndexToEdit = nil
//        } else if segue.identifier == "toActivitesViewController" {
//            if let indexPath = tableView.indexPathForSelectedRow {
//                let dest = segue.destination as! ActivitiesViewController
//                dest.tripId = Data.tripModels[indexPath.row].id
//            }
//
        }
    }
    
//    @IBAction func unwindToTripsViewController(_ unwindSegue: UIStoryboardSegue) {
//
//    }
    
    @IBAction func closeHelpView(_ sender: AppUIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.helpView.alpha = 0
        }) { (success) in
            self.helpView.removeFromSuperview()
            UserDefaults.standard.set(true, forKey: self.seenHelpView)
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
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view, actionPerformed: (Bool) -> ()) in
            self.tripIndexToEdit = indexPath.row
            self.performSegue(withIdentifier: "toAddTripSegue", sender: nil)
            actionPerformed(true)
        }
        
        edit.image = #imageLiteral(resourceName: "Edit")
        edit.backgroundColor = UIColor(named: "Edit")
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trip = Data.tripModels[indexPath.row]
        
        let storyboard = UIStoryboard(name: String(describing: ActivitiesViewController.self), bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! ActivitiesViewController // è come il destination controller nel caso di prepare(for segue:)
        vc.tripId = trip.id
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
