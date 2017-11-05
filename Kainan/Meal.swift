//
//  Meal.swift
//  Kainan
//
//  Created by Fulltime on 29/10/2017.
//  Copyright © 2017 University of the Philippines. All rights reserved.
//

import UIKit

class Meal {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initiailization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
        guard !name.isEmpty else {
            return nil
        }
        
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        //Initializa stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
    
    
}
