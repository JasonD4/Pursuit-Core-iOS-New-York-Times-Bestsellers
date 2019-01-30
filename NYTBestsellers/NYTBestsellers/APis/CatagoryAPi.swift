//
//  TypeAPI.swift
//  NYTBestsellers
//
//  Created by Jason on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

private let apiKey = "Wl8DnnK55dBA899QkYDGNZajIbJ7He8p"
private var catagoryString = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(apiKey)"

final class CatagoryAPI{
    
    private init() {}
    static func typeData(complete: @escaping( AppError?, [Catagory]?) -> Void)  {
        var catagory = [Catagory]()
        
        NetworkHelper.shared.performDataTask(endpointURLString: catagoryString) { (error, data) in
            if let error = error{
                    complete(error,nil)
            }
            else if let data = data{
                do{
                    catagory = try JSONDecoder().decode(CatagoryModel.self, from: data).results
                    complete(nil, catagory)
                }
                catch{
                    complete(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
    
    
}
