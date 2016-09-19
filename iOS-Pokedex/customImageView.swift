//
//  customImageView.swift
//  iOS-Pokedex
//
//  Created by John Paul Manoza on 31/08/2016.
//  Copyright © 2016 ProjectViper. All rights reserved.
//

import UIKit

class customImageView: UIImageView {

    override func awakeFromNib() {
        
        layer.cornerRadius = self.frame.width / 2
    }

}
