//
//  ActivitiesTableViewCell.swift
//  Itinerary
//
//  Created by Carmine Massei on 08/12/2018.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {

    @IBOutlet var cardView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var activityImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.addShadowAndRoundedCorners()
        titleLabel.font = UIFont(name: Theme.bodyFontNameDemiBold, size: 17)
        subtitleLabel.font = UIFont(name: Theme.bodyFontName, size: 17)
    }

    func setup(model: ActivityModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        activityImageView.image = getActivityImage(type: model.activityType)
    }
    
    func getActivityImage(type: ActivityType) -> UIImage? {
        switch type {
        case .auto:
            return UIImage(named: "Car")
        case .excursion:
            return UIImage(named: "Excursion")
        case .flight:
            return UIImage(named: "Flight")
        case .food:
            return UIImage(named: "Food")
        case .hotel:
            return UIImage(named: "Hotel")
        }
    }
    

}
