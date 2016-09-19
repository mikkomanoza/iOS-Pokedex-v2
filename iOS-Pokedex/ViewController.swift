//
//  ViewController.swift
//  iOS-Pokedex
//
//  Created by John Paul Manoza on 21/08/2016.
//  Copyright © 2016 ProjectViper. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
   
    
    var pokemon = [Pokemon]()
    var inSearchMode = false
    var filteredPokemon = [Pokemon]()
    
    var PlaySound: AVAudioPlayer!
    
    
    @IBOutlet weak var colletion: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        colletion.delegate = self
        colletion.dataSource = self
        searchBar.delegate = self
        
        
        searchBar.returnKeyType = UIReturnKeyType.Done
        
      
        parsePokemonSCV()
        
        
        initAudio()
    
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        
        searchBar.showsCancelButton = false
        
    }
    
    func parsePokemonSCV(){
    
        
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        
        do {
        
            let csv = try CSV(contentsOfURL: path)
            
            let rows = csv.rows
            
            for row in rows {
                
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                let poke = Pokemon(name: name, pokedexId: pokeId)
                pokemon.append(poke)
                
            }
            
        } catch let err as NSError{
        
            print(err.debugDescription)
        
        }
    
    }
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell {
        
            let poke: Pokemon!
            
            if inSearchMode{
                
                poke = filteredPokemon[indexPath.row]
            
            } else {
            
                poke = pokemon[indexPath.row]
            }
            
            
            
            cell.configureCell(poke)
            
            
            
        return cell
        
        } else {
        
            return UICollectionViewCell() }
        
    }
    
    


    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        var poke: Pokemon!
        
        if inSearchMode {
            
            poke = filteredPokemon[indexPath.row]
            
        } else {
            
            poke = pokemon[indexPath.row]
        }
        
        
        self.performSegueWithIdentifier("PokemonDetailVC", sender: poke)
    }
    
   
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchMode {
        
            return filteredPokemon.count
            
        } else {
        
            return pokemon.count
            
        }
    }
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    //size of the grid
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        
        return CGSize( width: 105, height: 105)
    }
    
    
    
    
    
    func initAudio(){
    
        let path = NSBundle.mainBundle().pathForResource("PoGo", ofType: "m4a")!
        
        do {
        
            PlaySound = try AVAudioPlayer(contentsOfURL: NSURL(string:path)!)
            PlaySound.prepareToPlay()
            PlaySound.numberOfLoops = -1 //infinite
            PlaySound.play()
        } catch let err as NSError {
         
            print(err.debugDescription)
        }
        
    }
    
    
    @IBAction func notePressed(sender: UIButton!) {
        
        
        if PlaySound.playing {
            
            PlaySound.stop()
            sender.alpha = 0.2
            
        } else {
            
         
            PlaySound.play()
            sender.alpha = 1.0
        }
    }
    
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        
        searchBar.setShowsCancelButton(true, animated: true)
        
        
        
    }
    
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
        searchBar.showsCancelButton = false
        view.endEditing(true)
    
        
    }
    
    
    
   
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        view.endEditing(true)
        
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
        
            inSearchMode = false
            searchBar.showsCancelButton = false
           
            view.endEditing(true)
            colletion.reloadData()
            
        } else {
        
            inSearchMode = true
            
           
            let lower = searchBar.text!.lowercaseString
            
   
            filteredPokemon = pokemon.filter({$0.name.rangeOfString(
                lower) != nil})
            
            colletion.reloadData() 
            
        }
    }


    //Segue DetailVC
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "PokemonDetailVC" {
        
            if let detailVC = segue.destinationViewController as? PokemonDetailVC {
                
                if let poke = sender as? Pokemon {
                    
                    detailVC.pokemons = poke
                }
            
            }
        
        }
    }


    
    
}


