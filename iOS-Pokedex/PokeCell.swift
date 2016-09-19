//
//  PokeCell.swift
//  iOS-Pokedex
//
//  Created by John Paul Manoza on 31/08/2016.
//  Copyright © 2016 ProjectViper. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
        clipsToBounds = true
        
    }
    
    
    func configureCell(pokemon: Pokemon) {
    
    self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
    
    
    
    
}
