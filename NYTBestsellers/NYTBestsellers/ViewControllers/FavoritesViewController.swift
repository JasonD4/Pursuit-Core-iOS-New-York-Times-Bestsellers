//
//  FavoritesViewController.swift
//  NYTBestsellers
//
//  Created by Jason on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var favoriteSetup = FavoriteUISetupView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(favoriteSetup)
        favoriteSetup.collectionOfFavorites.dataSource = self
        favoriteSetup.collectionOfFavorites.register(FavoriteCollectionViewCell.self, forCellWithReuseIdentifier: "Favorites")

    }
    

}

extension FavoritesViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favoriteSetup.collectionOfFavorites.dequeueReusableCell(withReuseIdentifier: "Favorites", for: indexPath) as? FavoriteCollectionViewCell else {return UICollectionViewCell()}
    return cell
    }
    
    
}
