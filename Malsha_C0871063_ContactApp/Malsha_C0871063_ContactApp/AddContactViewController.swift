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
    
    var contactList = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func AddOrFindContact(_ sender: UISegmentedControl) {
        switch addOrFindSegment.selectedSegmentIndex {
        case 0:
            self.clearTextFields()
        case 1 :
            self.clearTextFields()
        default:
            break
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func saveBtnClicked(_ sender: Any) {
        
        if firstNameText.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "First Name Field is Empty.", preferredStyle: .alert)
        }else if lastNameText.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "Last Name Field is Empty.", preferredStyle: .alert)
        }else if companyText.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "Company Field is Empty.", preferredStyle: .alert)
        }else if phoneNumberText.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "Phone Number Field is Empty.", preferredStyle: .alert)
        }else if emailText.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "Email Field is Empty.", preferredStyle: .alert)
        }else{
            let message = firstNameText.text! + " is now a contact."
            showAlert(title: "New Contact Saved", actionTitle: "OK", message: message, preferredStyle: .alert)
            self.clearTextFields()
            
        }
    }
    
    @IBAction func cancelBtnClicked(_ sender: Any) {
        
        let alert = UIAlertController(title: "Are you sure?", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "No Way!", style: .cancel)
        let sureAction = UIAlertAction(title: "Yes, I'm Sure!", style: .default, handler: {_ in
            self.clearTextFields()
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
    
    private func clearTextFields(){
        self.firstNameText.text = ""
        self.lastNameText.text = ""
        self.companyText.text = ""
        self.phoneNumberText.text = ""
        self.emailText.text = ""
    }
    
}

