//
//  ViewController.swift
//  Malsha_C0871063_ContactApp
//
//  Created by Malsha Lambton on 2022-10-23.
//

import UIKit

class AddContactViewController: UIViewController {
    
    @IBOutlet weak var firstNameText: UITextField!    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var phoneNumberText: UITextField!
    @IBOutlet weak var companyText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func AddOrFindContact(_ sender: UISegmentedControl) {
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func saveBtnClicked(_ sender: Any) {
    }
    
    @IBAction func cancelBtnClicked(_ sender: Any) {
    }
    
}

