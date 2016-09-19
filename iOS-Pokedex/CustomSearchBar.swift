//
//  CustomSearchBar.swift
//  iOS-Pokedex
//
//  Created by John Paul Manoza on 18/09/2016.
//  Copyright © 2016 ProjectViper. All rights reserved.
//

import UIKit

class CustomSearchBar: UISearchBar {

    override func awakeFromNib() {
        
      //textColor inside The SearchBar
        let textFieldInsideSearchBar = self.valueForKey("searchField") as? UITextField
        
        textFieldInsideSearchBar?.textColor = UIColor(red: 245.0/255.0, green: 226.0/255.0, blue: 192.0/255.0, alpha: 1.0)
        
        //searchBar tintColor
        self.tintColor = UIColor(red: 245.0/255.0, green: 226.0/255.0, blue: 192.0/255.0, alpha: 1.0)
    }

}
