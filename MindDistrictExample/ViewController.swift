//
//  ViewController.swift
//  MindDistrictExample
//
//  Created by Adrian Ortuzar on 09/01/2017.
//  Copyright © 2017 Adrian Ortuzar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: ViewModelProtocol! {
        didSet {
            self.viewModel.fullNameDidChange = { [unowned self] viewModel in
                self.fullNameLabel.text = viewModel.fullName
            }
        }
    }
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.button.addTarget(self.viewModel, action:#selector(ViewModel.showFullName), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

