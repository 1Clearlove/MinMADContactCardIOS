//
//  Person.swift
//  Contact Card
//
//  Created by Mathieu Knook on 19/10/2017.
//  Copyright © 2017 Mathieu Knook. All rights reserved.
//

import UIKit

class Person {
    var name: String
    var photo: UIImage?
    
    init?(name: String, photo: UIImage?) {
        if name.isEmpty {
            return nil
        }
        
        self.name = name
        self.photo = photo
    }
}
