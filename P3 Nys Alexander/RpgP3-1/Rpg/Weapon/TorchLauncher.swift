//
//  TorchLauncher.swift
//  Rpg
//
//  Created by ONIZUKA  on 11/08/2020.
//  Copyright © 2020 ONIZUKA . All rights reserved.
//

import Foundation

class TorchLauncher: Weapon {
    // Initializing the feature of the TorchLauncher, how much dammage it can inflict
static let dammage = 15
    init() {
        super.init(dammages: TorchLauncher.dammage)
    }
}
