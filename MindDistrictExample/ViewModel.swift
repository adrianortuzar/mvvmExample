//
//  ViewModel.swift
//  MindDistrictExample
//
//  Created by Adrian Ortuzar on 09/01/2017.
//  Copyright © 2017 Adrian Ortuzar. All rights reserved.
//

import Foundation

class ViewModel  {
    
    var person: Person? {
        didSet {
            self.fullNameDidChange?(self)
        }
    }
    
    var fullName: String? {
        set {

        }
        get {
            return self.person!.firstName + " " + self.person!.lastName
        }
    }
    
    var fullNameDidChange: ((ViewModel) -> ())?
    
    required init(person: Person) {
        self.person = person
    }
}
