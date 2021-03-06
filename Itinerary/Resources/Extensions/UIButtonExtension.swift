//
//  UIButtonExtension.swift
//  Itinerary
//
//  Created by Carmine Massei on 16/10/18.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import UIKit

extension UIButton {

    func createFloatingActionButton() {
        backgroundColor = Theme.tintColor
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }

}
