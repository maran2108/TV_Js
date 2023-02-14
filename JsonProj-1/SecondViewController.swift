//
//  SecondViewController.swift
//  JsonProj-1
//
//  Created by Rifluxyss on 09/02/23.
//

import UIKit


class SecondViewController: UIViewController {
   
    

    @IBOutlet weak var idValue: UITextField!
    @IBOutlet weak var nameValue: UITextField!
    @IBOutlet weak var userNameValue: UITextField!
    @IBOutlet weak var emailValue: UITextField!
    @IBOutlet weak var phoneValue: UITextField!
    @IBOutlet weak var websiteValue: UITextField!
    @IBOutlet weak var streetValue: UITextField!
    @IBOutlet weak var suiteValue: UITextField!
    @IBOutlet weak var cityValue: UITextField!
    @IBOutlet weak var zipcodeValue: UITextField!
    @IBOutlet weak var companyNameValue: UITextField!
    @IBOutlet weak var companyPharseValue: UITextField!
    @IBOutlet weak var companyBsValue: UITextField!
    @IBOutlet weak var latValue: UITextField!
    @IBOutlet weak var lngValue: UITextField!
    
    @IBOutlet weak var mySaveBtn: UIButton!
    var id_data = 0
    var name_data = ""
    var userName_data = ""
    var email_data = ""
    var phone_data = ""
    var website_data = ""
    var street_data = ""
    var suite_data = ""
    var city_data = ""
    var zipcode_data = ""
    var companyName_data = ""
    var companyPharse_data = ""
    var companyBs_data = ""
    var lat_data = ""
    var lng_data = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        idValue.text = String(id_data)
        nameValue.text = name_data
        userNameValue.text = userName_data
        emailValue.text = email_data
        phoneValue.text = phone_data
        websiteValue.text = website_data
        streetValue.text = street_data
        suiteValue.text = suite_data
        cityValue.text = city_data
        zipcodeValue.text = zipcode_data
        companyNameValue.text = companyName_data
        companyPharseValue.text = companyPharse_data
        companyBsValue.text = companyBs_data
        latValue.text = lat_data
        lngValue.text = lng_data
    }
    
   
    
}
