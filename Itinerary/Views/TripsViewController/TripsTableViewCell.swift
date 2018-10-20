//
//  TripsTableViewCell.swift
//  Itinerary
//
//  Created by Carmine Massei on 10/10/18.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    @IBOutlet var cardView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var tripImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.addShadowAndRoundedCorners()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 32)
        cardView.backgroundColor = Theme.accent
        
        tripImageView.layer.cornerRadius = cardView.layer.cornerRadius
    }
    
    
    func setup(tripModel: TripModel) {
        titleLabel.text = tripModel.title
        
        if let tripImage = tripModel.image {
            tripImageView.alpha = 0.3
            tripImageView.image = tripImage
            
            UIView.animate(withDuration: 1) {
                self.tripImageView.alpha = 1
            }
        }
        
    }

}

