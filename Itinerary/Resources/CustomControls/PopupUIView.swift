//
//  PopupUIView.swift
//  Itinerary
//
//  Created by Carmine Massei on 16/10/18.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import UIKit

class PopupUIView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addShadowAndRoundedCorners()
        backgroundColor = Theme.backgroundColor
    }
    
    

}
