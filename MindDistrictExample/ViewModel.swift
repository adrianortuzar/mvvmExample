//
//  ViewModel.swift
//  MindDistrictExample
//
//  Created by Adrian Ortuzar on 09/01/2017.
//  Copyright © 2017 Adrian Ortuzar. All rights reserved.
//

import Foundation

class ViewModel : ViewModelProtocol {
    
    let person: Person
    
    var fullName: String? {
        didSet {
            self.fullNameDidChange?(self)
        }
    }
    var fullNameDidChange: ((ViewModelProtocol) -> ())?
    
    required init(person: Person) {
        self.person = person
    }
    
    @objc func showFullName() {
        self.fullName = self.person.firstName + " " + self.person.lastName
    }
}
