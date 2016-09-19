//
//  PokemonDetailVC.swift
//  iOS-Pokedex
//
//  Created by John Paul Manoza on 06/09/2016.
//  Copyright © 2016 ProjectViper. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemons: Pokemon! //reference for segue call
    
    @IBOutlet weak var pokemonName: UILabel!
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var arrowImg: UIImageView!
    
    
    @IBOutlet weak var attackLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        pokemonName.text = pokemons.name.capitalizedString
        
        let img = UIImage(named: "\(pokemons.pokedexId )")
        mainImg.image = img
        currentEvoImg.image = img
        
        
        
    
        
        pokemons.downloadPokemonDetails { () -> () in 
            
            self.updateUI()
        }
        
    }
    
    
    func updateUI(){
    
    descriptionLbl.text = pokemons.desc
    attackLbl.text = pokemons.attack
    defenseLbl.text = pokemons.defense
    heightLbl.text = pokemons.height
    weightLbl.text = pokemons.weight
    typeLbl.text = pokemons.types
    pokedexIdLbl.text = "\(pokemons.pokedexId)" 
        
        
        //if there is no nextEvo then Hide the nextEvoImg
        if pokemons.nextEvoId == "" {
            
            arrowImg.hidden = true
            evoLbl.text = "NO EVOLUTION"
            nextEvoImg.hidden = true
             
        } else {
        
            //show nextEvoImg
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemons.nextEvoId)
            
            //to implement the nextEvoLvl
//            var str =  "Next Evolution: \(pokemons.nextEvoTxt)"
//            
//            if pokemons.nextEvoLvl != "" {
//            
//                str += " LVL \(pokemons.nextEvoLvl)"
//                
//                evoLbl.text = str
//            }
            
            
            
        }
        
    
    }
    
    
    
    
    
    
    
    @IBAction func dismissButton(sender: AnyObject){
    
        dismissViewControllerAnimated(true, completion: nil)
    
    }

   
    


}
