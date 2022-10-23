//
//  Contact.swift
//  Malsha_C0871063_ContactApp
//
//  Created by Malsha Lambton on 2022-10-23.
//

import Foundation

var incrementID = 0

struct Contact {
    var contactID = 0
    var firstName = ""
    var lastName = ""
    var company = ""
    var phoneNumber = ""
    var email = ""
    
    init(firstName: String = "", lastName: String = "", company: String = "", phoneNumber: String = "", email: String = "") {
        self.firstName = firstName
        self.lastName = lastName
        self.company = company
        self.phoneNumber = phoneNumber
        self.email = email
        self.contactID = incrementID
        incrementID += 1
    }
}
