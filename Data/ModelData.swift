//
//  ModelData.swift
//  VpnAppUI
//
//  Created by zehra özer on 21.08.2024.
//

import Foundation
import SwiftUI

struct CountryModel : Identifiable {
    var id = UUID()
    var name : countryFlags
    var flagImageName : CountryFlagImage
    var isFavorite : Bool
    var isLock : Bool
    

    init(id: UUID = UUID(), name: countryFlags, flagImageName: CountryFlagImage, isFavorite: Bool, isLock: Bool) {
        self.id = id
        self.name = name
        self.flagImageName = flagImageName
        self.isFavorite = isFavorite
        self.isLock = isLock
    }
    
}

enum countryFlags : String , CaseIterable {
    case usa = "USA"
    case germany = "Germany"
    case australis = "Australia"
    case  azerbaijan = "Azerbaijan"
    case belgium = "Belgium"
    case brazil = "Brazil"
    case denmark = "Denmark"
    case france = "France"
    case netherlands = "Netherlands"
    case uk = "United Kingdon"
    case spain = "Spain"
    case italy = "İtaly"
    case hungary = "Hungary"
    case norway = "Norway"
    case portugal = "Portugal"
    case russia = "Russia"
    case chile = "Chile"
    case turkey = "Turkey"
    case ukraine = "Ukraine"
    case uruguay = "Uruguay"
}


enum CountryFlagImage : String , CaseIterable {
    case usa
    case germany
    case australis
    case  azerbaijan
    case belgium
    case brazil
    case denmark
    case france
    case netherlands
    case uk
    case spain
    case italy
    case hungary
    case norway
    case portugal
    case russia
    case chile
    case turkey
    case ukraine
    case uruguay
}
