//
//  DataPersistanceManager.swift
//  NYTBestsellers
//
//  Created by Jason on 1/30/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class DataPersistenceHelper{
    private init() {}
    static func documentsDirectory() -> URL{
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    static func filepathToDocumentDirectory(filename: String) -> URL{
        
        return documentsDirectory().appendingPathComponent(filename)
    }
    
}
