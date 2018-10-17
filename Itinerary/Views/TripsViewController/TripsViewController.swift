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
}
