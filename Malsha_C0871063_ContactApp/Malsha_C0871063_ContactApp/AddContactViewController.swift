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
    var selectedContact : Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddOrFindContact(_ sender: UISegmentedControl) {
        switch addOrFindSegment.selectedSegmentIndex {
        case 0:
            break
        case 1 :
            if validFinder() {
                if let contacts = matchingContact(){
                    if contacts.count == 1 {
                        selectedContact = contacts[0]
                        self.firstNameText.text = selectedContact?.firstName
                        self.lastNameText.text = selectedContact?.lastName
                        self.companyText.text = selectedContact?.company
                        self.phoneNumberText.text = selectedContact?.phoneNumber
                        self.emailText.text = selectedContact?.email
                    }else{
                        showAlert(title: "Error", actionTitle: "OK", message: "You have more than one matching contacts for givan details. Please enter more details to find the correct contact", preferredStyle: .alert)
                        addOrFindSegment.selectedSegmentIndex = 0
                    }                
                }else{
                    showAlert(title: "Error", actionTitle: "OK", message: "No matching contact for givan details", preferredStyle: .alert)
                    addOrFindSegment.selectedSegmentIndex = 0
                }
            }else{
                showAlert(title: "Error", actionTitle: "OK", message: "Please enter at-least one field to find contact", preferredStyle: .alert)
                addOrFindSegment.selectedSegmentIndex = 0
            }
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
            if var contact = selectedContact {
                if let row = self.contactList.firstIndex(where: {$0.contactID == contact.contactID}) {
                    contact.firstName = firstNameText.text ?? ""
                    contact.lastName = lastNameText.text ?? ""
                    contact.company = companyText.text ?? ""
                    contact.phoneNumber = phoneNumberText.text ?? ""
                    contact.email = emailText.text ?? ""
                    self.contactList[row] = contact
                }
            }else{
                let newContact = Contact(firstName: firstNameText.text ?? "", lastName: lastNameText.text ?? "",company: companyText.text ?? "",phoneNumber: phoneNumberText.text ?? "",email: emailText.text ?? "")
                contactList.append(newContact)
                let message = firstNameText.text! + " is now a contact."
                showAlert(title: "New Contact Saved", actionTitle: "OK", message: message, preferredStyle: .alert)
            }
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
        addOrFindSegment.selectedSegmentIndex = 0
    }
    
    private func validFinder() -> Bool{
        if firstNameText.text != "" || lastNameText.text != "" || companyText.text != "" || phoneNumberText.text != "" || emailText.text != "" {
            return true
        }else{
            return false
        }
    }
    
    private func matchingContact() -> [Contact]?{
        
        var filterdContact = contactList
        
        if firstNameText.text != "" {
            filterdContact = filterdContact.filter( { return $0.firstName == firstNameText.text } )
        }
        if lastNameText.text != "" {
            filterdContact = filterdContact.filter( { return $0.lastName == lastNameText.text } )
        }
        if companyText.text != "" {
            filterdContact = filterdContact.filter( { return $0.company == companyText.text } )
        }
        if phoneNumberText.text != "" {
            filterdContact = filterdContact.filter( { return $0.phoneNumber == phoneNumberText.text } )
        }
        if emailText.text != "" {
            filterdContact = filterdContact.filter( { return $0.email == emailText.text } )
        }
      
        if filterdContact.count == 0 {
            return nil
        }else{
           return filterdContact
        }
    }
}

