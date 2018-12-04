//
//  ActivitiesViewController.swift
//  Itinerary
//
//  Created by Carmine Massei on 01/12/2018.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    var tripId: UUID!
    var tripModel: TripModel?
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self

        TripFunctions.readTrip(by: tripId) { [weak self] (model) in
            guard let self = self else {return}
            self.tripModel = model
            
            guard let model = model else {return}
            self.title = model.title
            self.backgroundImageView.image = model.image
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Action
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

   

}

extension ActivitiesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripModel?.dayModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = tripModel?.dayModels[section].title ?? ""
        let subTitle = tripModel?.dayModels[section].subtitle ?? ""
        return "\(title) - \(subTitle)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row].title
        return cell!
    }
    
    
}



