//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Jason on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var favorite = [FavoriteModel](){
        didSet{
           self.favoriteSetup.collectionOfFavorites.reloadData()
        }
    }
    
    
    var favoriteSetup = FavoriteUISetupView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(favoriteSetup)
        favoriteSetup.collectionOfFavorites.dataSource = self
        favoriteSetup.collectionOfFavorites.register(FavoriteCollectionViewCell.self, forCellWithReuseIdentifier: "Favorites")
        print(favorite.count)

    }
    override func viewWillAppear(_ animated: Bool) {
        favorite = FavoriteApi.loadTheEntry()
    }
    
    @objc func deletor(){
        
        let alert = UIAlertController(title: "Options", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title: "cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction.init(title: "delete", style: .destructive){(deleter) in
            let cell = FavoriteCollectionViewCell()
            FavoriteApi.removing(index: cell.optionButtons.tag )
            self.favorite = FavoriteApi.loadTheEntry()
                    self.favoriteSetup.collectionOfFavorites.reloadData()
            
        })
        self.present(alert, animated: true)

    
    }

}

extension FavoritesViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorite.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favoriteSetup.collectionOfFavorites.dequeueReusableCell(withReuseIdentifier: "Favorites", for: indexPath) as? FavoriteCollectionViewCell else {return UICollectionViewCell()}
        cell.bookDescription.text = favorite[indexPath.row].description
      cell.picture.image = UIImage.init(data: favorite[indexPath.row].image)
        cell.bestWeekSellerLabel.text = favorite[indexPath.row].title
        cell.optionButtons.tag = indexPath.row
        cell.optionButtons.addTarget(self, action: #selector(deletor), for: .touchUpInside)

    return cell
    }
    
    
}
