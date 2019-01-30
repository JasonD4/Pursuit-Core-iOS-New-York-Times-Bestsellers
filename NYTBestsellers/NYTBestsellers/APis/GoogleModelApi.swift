//
//  GoogleModelApi.swift
//  NYTBestsellers
//
//  Created by Jason on 1/30/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

private let apiKey = "AIzaSyA5k2qWhCXAOSlRRITkIAwXNT-LutmY_sI"

public final class GoogleAPI{
    private init(){}
    
    static var isbn = ""
    
    public static var googleAPI: String {
        // im ccalling you now do something
        let googleAPIEndpoing = "https://www.googleapis.com/books/v1/volumes?q=+isbn:\(isbn)&key=\(apiKey)"
        return googleAPIEndpoing
        
    }
    
    static func typeData(complete: @escaping( AppError?, [GBooks]?) -> Void)  {
//        var book: G_Books = ()
        NetworkHelper.shared.performDataTask(endpointURLString: googleAPI) { (error, data) in
            if let error = error{
                complete(error,nil)
            }
            else if let data = data{
                do{
                    let book = try JSONDecoder().decode(GoogleBooks.self, from: data)
                    complete(nil, book.items)
                }
                catch{
                    complete(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
    
}
