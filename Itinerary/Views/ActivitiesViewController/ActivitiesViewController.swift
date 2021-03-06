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
    @IBOutlet var addButton: AppUIButton!
    var tripId: UUID!
    var tripModel: TripModel?
    var tripTitle = ""
    var sectionHeaderHeight: CGFloat = 0.0
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = tripTitle
        addButton.createFloatingActionButton()
        tableView.dataSource = self
        tableView.delegate = self

        TripFunctions.readTrip(by: tripId) { [weak self] (model) in
            guard let self = self else {return}
            self.tripModel = model
            
            guard let model = model else {return}
            
            self.backgroundImageView.image = model.image
            self.tableView.reloadData()
        }
        
        sectionHeaderHeight = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier)?.contentView.bounds.height ?? 0
        
    }
    
    //MARK: - Action
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func addAction(_ sender: AppUIButton) {
        let alert = UIAlertController(title: "Which would you like to add?", message: nil, preferredStyle: .actionSheet)
        let dayAction = UIAlertAction(title: "Day", style: .default, handler: handleAddDay)
        
        let activityAction = UIAlertAction(title: "Activity", style: .default) { (action) in
            print("Add new activity")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(dayAction)
        alert.addAction(activityAction)
        alert.addAction(cancelAction)
        
        // Add action sheet for iPad
        alert.popoverPresentationController?.sourceView = sender
        // per far puntare la freccia dell'action sheet sul bottone
        alert.popoverPresentationController?.sourceRect = CGRect(x: 0, y: -4, width: sender.bounds.width, height: 0)
        present(alert, animated: true)
    }
    
    
    func handleAddDay(action: UIAlertAction){
        print("Add new day")
    }
   

}

extension ActivitiesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripModel?.dayModels.count ?? 0
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let title = tripModel?.dayModels[section].title ?? ""
//        let subTitle = tripModel?.dayModels[section].subtitle ?? ""
//        return "\(title) - \(subTitle)"
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivitiesTableViewCell.identifier) as! ActivitiesTableViewCell
        
        cell.setup(model: model!)
        
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//        }
//
//        cell?.textLabel?.text = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row].title
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let dayModel = tripModel?.dayModels[section]
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier) as! HeaderTableViewCell
        
        cell.setup(model: dayModel!)
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return sectionHeaderHeight
    }
    
}



