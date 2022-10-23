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
    @IBOutlet weak var addOrFindSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func AddOrFindContact(_ sender: UISegmentedControl) {
        switch addOrFindSegment.selectedSegmentIndex {
        case 0:
            break
        case 1 :
            break
        default:
            break
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func saveBtnClicked(_ sender: Any) {
        
        if firstNameText.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "First name cannot be empty.", preferredStyle: .alert)
        }else if lastNameText.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "Last name cannot be empty.", preferredStyle: .alert)
        }else if companyText.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "Company cannot be empty.", preferredStyle: .alert)
        }else if phoneNumberText.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "Phone number cannot be empty.", preferredStyle: .alert)
        }else if emailText.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "Email cannot be empty.", preferredStyle: .alert)
        }else{
            
        }
    }
    
    @IBAction func cancelBtnClicked(_ sender: Any) {
        
        let alert = UIAlertController(title: "Are you sure?", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "No Way!", style: .cancel)
        let sureAction = UIAlertAction(title: "Yes, I'm Sure!", style: .default, handler: {_ in
            self.firstNameText.text = ""
            self.lastNameText.text = ""
            self.companyText.text = ""
            self.phoneNumberText.text = ""
            self.emailText.text = ""
        })
        alert.addAction(sureAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
    
    private func showAlert(title : String, actionTitle : String, message : String, preferredStyle : UIAlertController.Style){
        
        let alert = UIAlertController(title:title , message:message , preferredStyle: preferredStyle)
        let action = UIAlertAction(title: actionTitle, style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}

