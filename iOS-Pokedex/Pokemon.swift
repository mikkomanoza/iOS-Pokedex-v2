//
//  Pokemon.swift
//  iOS-Pokedex
//
//  Created by John Paul Manoza on 30/08/2016.
//  Copyright © 2016 ProjectViper. All rights reserved.
//

import UIKit
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvo: String!
    
    private var _nextEvoTxt: String!
    private var _nextEvoId: String!
    private var _nextEvoLvl: String!
    
    private var _pokemonURL: String!
    
   
    var nextEvoTxt: String {
        
        if _nextEvoTxt == nil {
            _nextEvoTxt = ""
         }
        
    return _nextEvoTxt
        
    }
    
    
    var nextEvoId: String {
    
        if _nextEvoId == nil {
            _nextEvoId = ""
        }
        
    return _nextEvoId
    
    }
    
    var nextEvoLvl: String {

    get {
        
            if _nextEvoLvl == nil {
               _nextEvoLvl = ""
        }
        
    return _nextEvoLvl
       
      }
        
    }

    var name: String {
    
        return _name
    }
    
    var pokedexId: Int {
    
        return _pokedexId
    }
    
    var desc: String {
        
        if _description == nil {
            _description = ""
        }
        return _description
        
    }
    
    var attack: String {
    
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var defense: String {
    
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var weight: String {
    
        if _weight == nil {
            _weight = ""
        }
        
        return _weight
    }
    
    var height: String {
        
        if _height == nil {
            _height = ""
        }
    
        return _height
    }
    
    var types: String {
        
        if _type == nil {
            _type = ""
        }
    
        return _type
    }
    
    
    
    
    
    init(name: String, pokedexId: Int){
    
     
        self._name = name
        self._pokedexId = pokedexId
        
        //setting up URL
        _pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
    
    }
    


    func downloadPokemonDetails(completed: DownloadComplete){
    
        let url = NSURL(string: _pokemonURL)!
        
    
        Alamofire.request(.GET, url).responseJSON { Response in
            
            
            let Result = Response.result
            
            //print(Result.value.debugDescription) For Testing the JSON
            
            //setting up dictionary
            //convert JSON to dictionary
            if let dict = Result.value as? Dictionary<String, AnyObject>{
                
                if let weight = dict["weight"] as? String {
                    
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                
                    self._defense = "\(defense)"
                }
                
                
                
                print(self._weight)
                print(self._height)
                print(self._attack)
                print(self._defense)
                
                
                
        
                if let types = dict["types"] as? [Dictionary<String, String>] where types.count > 0 {
                
                    //print(type.debugDescription) For testing the JSON
                    
                    if let name = types[0]["name"] {
                    
                        self._type = name.capitalizedString
                    
                    }
                    
                    if types.count > 1 {
                    
                        for var x = 1; x < types.count; x+=1{
                            
                            if let name = types[x]["name"] {
                            
                                self._type! += "/\(name.capitalizedString)"
                            }
                        }
                    }
                    
                } else {
                
                        self._type = ""
                }
                
                
                print(self._type)
                
                
                //desc
                if let descArray = dict["descriptions"] as? [Dictionary<String, String>] where descArray.count > 0 {
                
                    
                    if let url = descArray[0]["resource_uri"] {
                        
                        let nsurl = NSURL(string: "\(URL_BASE)\(url)")!
                        
                        Alamofire.request(.GET, nsurl).responseJSON { Response in
                        
                            let descResult = Response.result
                           
                        //dictionary created
                        if let descDict = descResult.value as? Dictionary<String,AnyObject> {
                            
                            if let description = descDict["description"] as? String {
                            
                                self._description = description
                                    print(self._description)
                                
                                
                                
                               //closure 
                               completed()
                            
                            }
                            
                            
                        }
                            
                    }
                    
                }
                    
                    } else { //if there is no desc
                    
                        self._description = ""
                    }
                
                
                //grab the very next evolution
                if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>] where evolutions.count > 0 {
                    
                    if let to = evolutions[0]["to"] as? String {
                    
                        if to.rangeOfString("mega") == nil { //Mega is not found
                            
                            if let uri = evolutions[0]["resource_uri"] as? String {
                            
                                //replacing
                                //let's create new str
                                let newString = uri.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
                                
                                let num = newString.stringByReplacingOccurrencesOfString("/", withString: "")
                                
                                //grab the next pokemon
                                self._nextEvoId = num
                                self._nextEvoTxt = to
                                
                                if let lvl = evolutions[0]["level"] as? Int {
                                
                                    self._nextEvoLvl = "\(lvl)"
                                }
                            
                                
                                print(self._nextEvoId)
                                print(self._nextEvoTxt)
        
                                //print(self._nextEvoLvl)
                                
                            }
                            
                        }
                    
                    }
                
                
                
                }
                
                
                
                
                
                }
                
            }
            
            
        }
        
        
    

    
    
}
    
        
        
        
    

    
