//
//  FavoriteAPI.swift
//  NYTBestsellers
//
//  Created by Jason on 1/30/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class FavoriteApi{
    private init () {}
private static let storing = "FavoriteBook.plist"
private static var favorite = [FavoriteModel]()

    static func removing(index:Int){
        favorite.remove(at: index)
        saveTheEntry()
    }
    static func appening(type : FavoriteModel){
        favorite.append(type)
        saveTheEntry()
    }
    
    static func saveTheEntry(){
        
        let pathToSaveTo = DataPersistenceHelper.filepathToDocumentDirectory(filename: storing)
        do{
            let favoriteBook = try PropertyListEncoder().encode(favorite)
            try favoriteBook.write(to: pathToSaveTo, options: Data.WritingOptions.atomic)
        }catch{
            print("error in the static function saveTheEntry: \(error)")
        }
    }
    
    static func loadTheEntry() -> [FavoriteModel]{
        
        let path = DataPersistenceHelper.filepathToDocumentDirectory(filename: storing).path
        if FileManager.default.fileExists(atPath: path){
            if let data = FileManager.default.contents(atPath: path){
                do{// [phototJornal]
                    favorite = try PropertyListDecoder().decode([FavoriteModel].self, from: data)
                }catch{
                    print(error)
                }
            }else{
                print("LoadtheEntry func data area is nil")
            }
        }
        else{
            print("\(storing) does not exsist")
        }
        return favorite
    }
}
