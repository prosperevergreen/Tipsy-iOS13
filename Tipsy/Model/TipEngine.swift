//
//  TipEngine.swift
//  Tipsy
//
//  Created by Prosper Evergreen on 02.07.2020.
//  Copyright © 2020 proSPEC. All rights reserved.
//

import UIKit

struct TipEngine {
    var initCost: Float? = 0.00
    var tipPct: Float = 0
    var splitCounter:Int = 2
    
    mutating func setTip(tip value: String) {
        switch value {
        case "0%":
            tipPct = 0
        case "10%":
            tipPct = 0.1
        case "20%":
            tipPct = 0.2
        default: break
        }

    }
    
    func costPerPerson() -> Float {
        let tipCost = initCost ?? 0  * tipPct
        let finalCost = initCost ?? 0 + tipCost
        let perPerson = finalCost / Float(splitCounter)
        return perPerson
    }
    
}
