//
//  HeaderTableViewCell.swift
//  Itinerary
//
//  Created by Carmine Massei on 08/12/2018.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.font = UIFont(name: Theme.bodyFontNameBold, size: 17)
        subtitleLabel.font = UIFont(name: Theme.bodyFontName, size: 15)
    }

    
    func setup(model: DayModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }
    

}
