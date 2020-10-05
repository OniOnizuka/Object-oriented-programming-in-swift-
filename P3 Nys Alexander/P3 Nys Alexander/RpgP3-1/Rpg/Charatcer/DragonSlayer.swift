//
//  DragonSlayer.swift
//  Rpg
//
//  Created by ONIZUKA  on 11/08/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation

class DragonSlayer: Character{
    static let lifepoint = 90
    static let caNHeal = 30
    // Initializing the feature of the DragonSlayer
    init(name:String){
        super.init(name: name, weapon: TorchLauncher(), lifePoint: DragonSlayer.lifepoint, canHeal: DragonSlayer.caNHeal)
    }
    
}
