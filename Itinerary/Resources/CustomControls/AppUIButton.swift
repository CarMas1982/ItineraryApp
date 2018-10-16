//
//  AppUIButton.swift
//  Itinerary
//
//  Created by Carmine Massei on 16/10/18.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import UIKit

class AppUIButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = Theme.tintColor
        layer.cornerRadius = frame.height / 2
        setTitleColor(UIColor.white, for: .normal)
        
    }

}
