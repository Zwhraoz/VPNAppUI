//
//  CountryViewModel.swift
//  VpnAppUI
//
//  Created by zehra özer on 21.08.2024.
//

import Foundation
import SwiftUI


class CountryViewModel : ObservableObject {
    @Published var countries : [CountryModel] = []
    @Published var searchText : String = ""
    
    init () {
        loadCountries()
    }
    
    func loadCountries() {
        countries = [
            CountryModel(name: .usa, flagImageName: .usa, isFavorite: false, isLock: true),
        CountryModel(name: .germany, flagImageName: .germany, isFavorite: false, isLock: false),
        CountryModel(name: .australis, flagImageName: .australis, isFavorite: false, isLock: false),
        CountryModel(name: .azerbaijan, flagImageName: .azerbaijan, isFavorite: false, isLock: false),
        CountryModel(name: .belgium, flagImageName: .belgium, isFavorite: false, isLock: false),
        CountryModel(name: .brazil, flagImageName: .brazil, isFavorite: false, isLock: false),
            CountryModel(name: .denmark, flagImageName: .denmark, isFavorite: false, isLock: true),
            CountryModel(name: .france, flagImageName: .france, isFavorite: false, isLock: false),
            CountryModel(name: .netherlands, flagImageName: .netherlands, isFavorite: false, isLock: true),
            CountryModel(name: .uk, flagImageName: .uk, isFavorite: false, isLock: true),
            CountryModel(name: .spain, flagImageName: .spain, isFavorite: false, isLock: false),
            CountryModel(name: .italy, flagImageName: .italy, isFavorite: false, isLock: true),
            CountryModel(name: .hungary, flagImageName: .hungary, isFavorite: false, isLock: false),
            CountryModel(name: .norway, flagImageName: .norway, isFavorite: false, isLock: true),
            CountryModel(name: .portugal, flagImageName: .portugal, isFavorite: false, isLock: true),
            CountryModel(name: .russia, flagImageName: .russia, isFavorite: false, isLock: false),
            CountryModel(name: .chile, flagImageName: .chile, isFavorite: false, isLock: true),
            CountryModel(name: .turkey, flagImageName: .turkey, isFavorite: false, isLock: true),
            CountryModel(name: .ukraine, flagImageName: .ukraine, isFavorite: false, isLock: true),
            CountryModel(name: .uruguay, flagImageName: .uruguay, isFavorite: false, isLock: false)
            ]
    }
    
    var filteredCountries : [CountryModel] {
        if searchText.isEmpty {
            return countries
        } else {
            return countries.filter {
                $0.name.rawValue.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    func toogleFavorite (for country : CountryModel) {
        if let index = countries.firstIndex(where: { $0.id == country.id }) {
            countries[index].isFavorite.toggle()
        }
    }
}
