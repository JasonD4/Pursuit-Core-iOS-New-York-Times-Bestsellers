//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Jason on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersViewController: UIViewController {
    var uiSetup = CollectionOfUISetUpView()
    var books = [1,2,3]
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBarItem = UITabBarItem.init(title: <#T##String?#>, image: <#T##UIImage?#>, tag: <#T##Int#>)
//        self.tabBarItem.title = "Best Sellers"
        view.addSubview(uiSetup)
        uiSetup.collectionOfBooks.dataSource = self
        uiSetup.collectionOfBooks.register(BestSellingCollectionViewCell.self, forCellWithReuseIdentifier: "BestSelling")

    }
 

}

extension BestSellersViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return books.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = uiSetup.collectionOfBooks.dequeueReusableCell(withReuseIdentifier: "BestSelling", for: indexPath) as? BestSellingCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }


}

extension BestSellersViewController: UIPickerViewDelegate{
    
}
