//
//  CropCircleProfilePic.swift
//  iOS-Pokedex
//
//  Created by John Paul Manoza on 18/09/2016.
//  Copyright © 2016 ProjectViper. All rights reserved.
//

import UIKit

class CropCircleProfilePic: UIImageView {

    override func awakeFromNib() {
        
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }

}
