//
//  HapticFeedBack.swift
//  VpnAppUI
//
//  Created by zehra özer on 21.08.2024.
//

import Foundation
import SwiftUI

class HapticFeedBack {
    #if os (watchOS)
    static func playSelection(){
        WKInterfaceDevice.current().play(.click)
    }
    
    #elseif os (İOS)
    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    static func playSelection () {
        UISelectionFeedbackGenerator().selectionChanged()
    }
    
    #else
    static func playSelection () {
        
    }
    
    #endif 
}
