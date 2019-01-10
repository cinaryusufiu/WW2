//
//  BaseCharacters.swift
//  WW2
//
//  Created by Yusuf Çınar on 8.01.2019.
//  Copyright © 2019 Yusuf Çınar. All rights reserved.
//

import Foundation

class BaseCharacters : NSObject {
    
    var stringName : String
    var location: Int
    let attactPoint :Int
    var isDied = false 
    var healthy: Int {
        didSet {
            if healthy <= 0 {
                isDied = true
            }
        }
    }
    
    init(name : String , healthy : Int , location : Int ,attactPoint: Int) {
        self.stringName = name
        self.healthy = healthy
        self.location = location
        self.attactPoint = attactPoint
    }
    func healhtyDegrease(degrease: Int , name : String ) {
        self.healthy = healthy - degrease
       // print("\(name) attack is \(degrease)")
    }
    
}


