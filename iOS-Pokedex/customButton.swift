//
//  customButton.swift
//  iOS-Pokedex
//
//  Created by John Paul Manoza on 15/09/2016.
//  Copyright © 2016 ProjectViper. All rights reserved.
//

import UIKit

class customButton: UIButton {

    override func awakeFromNib() {
        
        layer.cornerRadius = 12.0
        clipsToBounds = true
    }

}
