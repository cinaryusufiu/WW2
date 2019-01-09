//
//  Hero.swift
//  WW2
//
//  Created by Yusuf Çınar on 8.01.2019.
//  Copyright © 2019 Yusuf Çınar. All rights reserved.
//

import Foundation

class Hero: BaseCharacters {
   
    let name = "Hero"
    init(healthy: Int , location : Int , attackPoint : Int) {
        super.init(name: self.name, healthy: healthy, location: location, attactPoint: attackPoint)
    }
    
    override func healhtyDegrease(degrease: Int, name: String) {
        super.healhtyDegrease(degrease: degrease, name: name)
    }
   
}