//
//  customLabel.swift
//  iOS-Pokedex
//
//  Created by John Paul Manoza on 31/08/2016.
//  Copyright © 2016 ProjectViper. All rights reserved.
//

import UIKit

class customLabel: UILabel {

    
    override func awakeFromNib() {
        
        self.layer.cornerRadius = 9.0
        self.clipsToBounds = true
    }

    
    
}
