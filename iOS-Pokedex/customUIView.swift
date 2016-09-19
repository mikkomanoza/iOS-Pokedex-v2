//
//  customUIView.swift
//  iOS-Pokedex
//
//  Created by John Paul Manoza on 13/09/2016.
//  Copyright © 2016 ProjectViper. All rights reserved.
//

import UIKit

class customUIView: UIView {

    override func awakeFromNib() {
        layer.cornerRadius = 6.0
        clipsToBounds = true
    }
}
