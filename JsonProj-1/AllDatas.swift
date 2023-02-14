//
//  AllDatas.swift
//  JsonProj-1
//
//  Created by Rifluxyss on 09/02/23.
//

import Foundation
struct AllData: Decodable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: addressDetails
    
    var phone: String
    var website: String
    var company: companyDetails
}

struct addressDetails: Decodable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: geoDetails
}
struct geoDetails: Decodable {
    var lat: String
    var lng: String
}

struct companyDetails: Decodable {
    var name: String
    var catchPhrase: String
    var bs: String
}
