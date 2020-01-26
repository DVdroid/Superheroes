//
//  HeroVM.swift
//  VA_SuperHeroes
//
//  Created by Vikash Anand on 30/10/19.
//  Copyright © 2019 Vikash Anand. All rights reserved.
//

final class HeroVM {
    
    static private var heroDetailsUrl: [String]  = {
        let ironManUrl = "https://www.marvel.com/characters/iron-man-tony-stark"
        let hulkUrl = "https://www.marvel.com/characters/hulk-bruce-banner"
        let spiderManUrl = "https://www.marvel.com/characters/spider-man-peter-parker"
        let blackWidowManUrl = "https://www.marvel.com/characters/black-widow-natasha-romanoff"
        let thorUrl = "https://www.marvel.com/characters/thor-thor-odinson"
        
        return [ironManUrl, hulkUrl, spiderManUrl, blackWidowManUrl, thorUrl]
    }()
    
    static private var heroes: [Hero]  = {
        let ironMan = Hero(name: "ironMan", universeName: "MCU", iconIdentifier: .IronMan)
        let hulk = Hero(name: "hulk", universeName: "MCU", iconIdentifier: .Hulk)
        let spiderMan = Hero(name: "spiderMan", universeName: "MCU", iconIdentifier: .SpiderMan)
        let blackWidow = Hero(name: "blackWidow", universeName: "MCU", iconIdentifier: .BlackWidow)
        let thor = Hero(name: "thor", universeName: "MCU", iconIdentifier: .Thor)
        
        return [ironMan, hulk, spiderMan, blackWidow, thor]
    }()
    
    static private subscript(modelIndex: Int) -> Hero {
        get {
            return self.heroes[modelIndex]
        }
    }
    
    static subscript(urlIndex: Int) -> String {
        get {
            return self.heroDetailsUrl[urlIndex]
        }
    }
    
    static func count() -> Int {
        self.heroes.count
    }
    
    static func iconIdentifier(for index: Int) -> AssetIdentifier {
        self.heroes[index].iconIdentifier
    }
      
    static func name(for index: Int) -> String {
        self.heroes[index].name
    }
}

enum AssetIdentifier: String {
    case IronMan = "ironMan"
    case Hulk = "hulk"
    case SpiderMan = "spiderMan"
    case BlackWidow = "blackWidow"
    case Thor = "thor"
}
