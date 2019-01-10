//
//  WarManager.swift
//  WW2
//
//  Created by Yusuf Çınar on 9.01.2019.
//  Copyright © 2019 Yusuf Çınar. All rights reserved.
//

import Foundation

class WarManager: NSObject {
    
    override init() {
        super.init()
        
    }
    func startFight(myHero : Hero , enemy : BaseCharacters){
        if myHero.isDied == true || enemy.isDied == true{
            return
        }
        
        myHero.location = enemy.location
        
        while true {
            myHero.healhtyDegrease(degrease: enemy.attactPoint , name: enemy.stringName)
            enemy.healhtyDegrease(degrease: myHero.attactPoint, name: myHero.stringName)
            
            if myHero.isDied == true || enemy.isDied == true {
                break
            }
        }
        if enemy.isDied == true {
            print("\(myHero.stringName) defeated \(enemy.stringName) with \(myHero.healthy - enemy.healthy) HP remaining")
        }
        
        if myHero.isDied == true {
            print("\(enemy.stringName) defeated \(myHero.stringName) with \(enemy.healthy - myHero.healthy) HP remaining")
        }
        
    }
    func startWarWithAllEnemy(resource : Int , myHero : Hero , enemyArray : [BaseCharacters]) -> Bool {
        
        print("\(myHero.stringName) started journey with \(myHero.healthy) HP!")
        
        for item in enemyArray {
            if myHero.isDied {
                return false
            }
            if myHero.location >= resource {
                return true
            }
            startFight(myHero: myHero, enemy: item)
        }
        return true
    }
}

