//
//  ViewController.swift
//  WW2
//
//  Created by Yusuf Çınar on 8.01.2019.
//  Copyright © 2019 Yusuf Çınar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let arr = [Hero(healthy: 1000, location: 0, attackPoint: 10),
               Zombie(healthy: 300, location: 1681, attackPoint: 7),
               Bug(healthy: 50, location: 276, attackPoint: 2),
               Bug(healthy: 50, location: 489, attackPoint: 2),
               Lion(healthy: 100, location: 1527, attackPoint: 15),
               Lion(healthy: 100, location: 2865, attackPoint: 15),
               Zombie(healthy: 300, location: 3523, attackPoint: 7)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let sortedArray = Helper.sortedCharacters(arr: arr)
        let myHeroandEnemy = Helper.removeHeroAllCharactersArray(arr: sortedArray)
        let warManager = WarManager()
        
        guard let myHero = myHeroandEnemy.0 , let enemyArray = myHeroandEnemy.1 else { return }
       let result =  warManager.startWarWithAllEnemy(resource: 5000, myHero: myHero, enemyArray: enemyArray )
        if result {
            print("Hero is Survived!")
        }
        else {
            print("Hero is Dead!! Last seen at position \(myHero.location) !!")
        }
    }
}

