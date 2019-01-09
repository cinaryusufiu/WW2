//
//  Helper.swift
//  WW2
//
//  Created by Yusuf Çınar on 8.01.2019.
//  Copyright © 2019 Yusuf Çınar. All rights reserved.
//

import Foundation

enum CharacterType {
    case hero
    case zombie
    case bug
    case lion
    case mutant
    case zombieDog
}
class Helper: NSObject {
    
    static func sortedCharacters(arr : [BaseCharacters]) -> [BaseCharacters]{
        if arr.isEmpty || arr.count == 0  {
            return [BaseCharacters]()
        }
        let arrSorted = arr.sorted { (first, second) -> Bool in
            return first.location < second.location
        }
        return arrSorted
    }
    
    static func removeHeroAllCharactersArray(arr : [BaseCharacters]) ->(Hero? , [BaseCharacters]?){
        
        if  arr.isEmpty || arr.count == 0 {
            return (nil ,nil)
        }
        
      //  sortedCharacters(arr: arr)
        
        var arrEdit = [BaseCharacters]()
        var myHero : Hero?
        for  item in arr {
            if item.isKind(of: Hero.self){
                myHero = item as? Hero
            }
            else {
                arrEdit.append(item)
            }
        }
        return (myHero , arrEdit)
    }
    
    static func createRandomCharacters(type : CharacterType) -> AnyObject {
        
        switch type {
        case .hero:
            return Hero(healthy: 500, location: 0, attackPoint: 10)
        case .bug:
            return Bug(healthy: 500, location: 0, attackPoint: 10)
        case .lion:
            return Lion(healthy: 500, location: 0, attackPoint: 10)
        case .mutant:
            return Mutant(healthy: 500, location: 0, attackPoint: 10)
        case .zombie:
            return Zombie(healthy: 500, location: 0, attackPoint: 10)
        case .zombieDog:
            return ZombieDog(healthy: 500, location: 0, attackPoint: 10)
        }}
    
}



