//
//  ViewModelProtocol.swift
//  MindDistrictExample
//
//  Created by Adrian Ortuzar on 09/01/2017.
//  Copyright © 2017 Adrian Ortuzar. All rights reserved.
//

import Foundation

protocol ViewModelProtocol: class {
    
    var fullName: String? { get }
    
    var fullNameDidChange: ((ViewModelProtocol) -> ())? { get set } // function to call when fullName did change
    
    init(person: Person)
    
    func showFullName()
}
