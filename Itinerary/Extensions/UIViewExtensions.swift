//
//  UIViewExtensions.swift
//  Itinerary
//
//  Created by Carmine Massei on 14/10/18.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import UIKit

extension UIView {

    func addShadowAndRoundedCorners(){
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
    }

}
