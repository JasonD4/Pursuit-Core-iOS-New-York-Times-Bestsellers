//
//  CollectionView.swift
//  NYTBestsellers
//
//  Created by Jason on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class CollectionOfUISetUpView: UIView {
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
    setUpConstrainsForCollectionView()
        setConstrainsForPicker()
    }
    
    lazy var collectionOfBooks: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 300)
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .magenta
        return collection
    }()
    
    
    lazy var pickCatagory: UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    func setUpConstrainsForCollectionView(){
        addSubview(collectionOfBooks)
        collectionOfBooks.translatesAutoresizingMaskIntoConstraints = false
        collectionOfBooks.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        collectionOfBooks.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionOfBooks.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true

        collectionOfBooks.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    }
    func setConstrainsForPicker(){
                addSubview(pickCatagory)
                pickCatagory.translatesAutoresizingMaskIntoConstraints = false
                pickCatagory.topAnchor.constraint(equalTo: collectionOfBooks.bottomAnchor).isActive = true
                pickCatagory.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
                pickCatagory.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
                pickCatagory.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    

}
