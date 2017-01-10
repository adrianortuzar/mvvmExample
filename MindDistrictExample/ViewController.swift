//
//  ViewController.swift
//  MindDistrictExample
//
//  Created by Adrian Ortuzar on 09/01/2017.
//  Copyright © 2017 Adrian Ortuzar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: ViewModel
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    init(viewModel: ViewModel){
        
        self.viewModel = viewModel
        
        super.init(nibName:"ViewController", bundle: nil)
        
        self.viewModel.fullNameDidChange = { [unowned self] viewModel in
            self.fullNameLabel.text = viewModel.fullName
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.nameField.text = self.viewModel.person!.firstName
        self.surnameField.text = self.viewModel.person!.lastName
        
        self.viewModel.fullNameDidChange!(self.viewModel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let textFieldText: NSString = (textField.text ?? "") as NSString
        let txtAfterUpdate = textFieldText.replacingCharacters(in: range, with: string)
        
        if textField == nameField {
            self.viewModel.person?.firstName = txtAfterUpdate
        }
        else {
            self.viewModel.person?.lastName = txtAfterUpdate
        }
        
        
        return true
    }
}

