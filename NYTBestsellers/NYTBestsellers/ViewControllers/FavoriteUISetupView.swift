//
//  FavoriteUISetupView.swift
//  NYTBestsellers
//
//  Created by Jason on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteUISetupView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        backgroundColor = .white
        setUpContraints()
    }
    lazy var collectionOfFavorites: UICollectionView = {
        
        var collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
        collectionLayout.itemSize = CGSize.init(width: 300, height: 400)
        var collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionLayout)
        return collection
    }()

    func setUpContraints(){
        addSubview(collectionOfFavorites)
        collectionOfFavorites.backgroundColor = UIColor(red:0.00, green:1.00, blue:1.00, alpha:1.0)
        collectionOfFavorites.translatesAutoresizingMaskIntoConstraints = false
        collectionOfFavorites.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        collectionOfFavorites.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionOfFavorites.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionOfFavorites.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
}
