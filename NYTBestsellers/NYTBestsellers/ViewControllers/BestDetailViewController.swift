//
//  BestDetailViewController.swift
//  NYTBestsellers
//
//  Created by Jason on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestDetailViewController: UIViewController {
    var detailsviewSetUp = DetailView()

    var book: BookInformation?
    var isbn: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailsviewSetUp)
        theUpdateTheUI()
        navigationItem.title = book?.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoriteSave))
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func theUpdateTheUI(){
        detailsviewSetUp.bestWeekSellerLabel.text = book?.author
        detailsviewSetUp.picture.image = UIImage.init(named: "myPlaceHolder")
        detailsviewSetUp.bookDescription.text = book?.description
        
        
        GoogleAPI.isbn = isbn ?? ""
        GoogleAPI.typeData { (error, bookImage) in
            if let error = error{
                print(error)
            }
            if let bookImage = bookImage{
                
                DispatchQueue.main.async {
                self.detailsviewSetUp.bookDescription.text = bookImage[0].volumeInfo.description
                    }
                ImageHelper.fetchImageFromNetwork(urlString: bookImage[0].volumeInfo.imageLinks.thumbnail! ) { (error, image) in
                    if let error = error{
                        print(error)
                    }
                    if let image = image{
                        self.detailsviewSetUp.picture.image = image
                        
                    }
                }
            }
        }
    }


   @objc func favoriteSave()
   {
    let book = FavoriteModel.init(image: (detailsviewSetUp.picture.image?.jpegData(compressionQuality: 50))!, title: self.book?.title ?? "no title?", description: self.book?.description ?? detailsviewSetUp.bookDescription.text)
    FavoriteApi.appening(type: book)
    
    }


}
