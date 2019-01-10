//
//  Helper.swift
//  WW2
//
//  Created by Yusuf Çınar on 8.01.2019.
//  Copyright © 2019 Yusuf Çınar. All rights reserved.
//

import Foundation

enum CharacterType {
    case defaultType
    case zombie
    case bug
    case lion
    case mutant
    case zombieDog
}
class Helper: NSObject {
    // lokasyona gore siraladim.
    static func sortedCharacters(arr : [BaseCharacters]) -> [BaseCharacters]{
        if arr.isEmpty || arr.count == 0  {
            return [BaseCharacters]()
        }
        let arrSorted = arr.sorted { (first, second) -> Bool in
            return first.location < second.location
        }
        return arrSorted
    }
    // ilk dusundugum yapida butun karakterleri tek bir arraydan yonetmek istemistim. o yuzden boyle bir method yazdim.
    static func removeHeroAllCharactersArray(arr : [BaseCharacters]) ->(Hero? , [BaseCharacters]?){
        
        if  arr.isEmpty || arr.count == 0 {
            return (nil ,nil)
        }
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
    
    static func createRandomCharacters(index : Int) -> CharacterType {

        switch index {
        
        case 0:
            return .zombie
        case 1:
            return .bug
        case 2:
            return .lion
        case 3:
            return .mutant
        case 4:
            return .zombieDog
        default:
            return .defaultType
        }}
}



