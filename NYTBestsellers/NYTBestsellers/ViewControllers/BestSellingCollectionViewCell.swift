//
//  BestSellingCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Jason on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellingCollectionViewCell: UICollectionViewCell {

    var collectionView = CollectionOfUISetUpView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    lazy var picture: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var bestWeekSellerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var bookDescription: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        
        return textView
    }()
    
    private func commonInit(){
     pictureConstraint()
        labelConstraint()
        bookText()
    }
    
    func pictureConstraint(){
        addSubview(picture)
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        picture.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        picture.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        picture.heightAnchor.constraint(equalToConstant: 175).isActive = true
        picture.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func labelConstraint(){
        addSubview(bestWeekSellerLabel)
        bestWeekSellerLabel.translatesAutoresizingMaskIntoConstraints = false
        bestWeekSellerLabel.topAnchor.constraint(equalTo: picture.bottomAnchor).isActive = true
        bestWeekSellerLabel.trailingAnchor.constraint(equalTo: collectionView.collectionOfBooks.trailingAnchor, constant: 20)
        bestWeekSellerLabel.leadingAnchor.constraint(equalTo: collectionView.collectionOfBooks.leadingAnchor, constant: 20)
    }
    
    func bookText(){
        addSubview(bookDescription)
        bookDescription.translatesAutoresizingMaskIntoConstraints = false
        bookDescription.topAnchor.constraint(equalTo: bestWeekSellerLabel.bottomAnchor).isActive = true
        bookDescription.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bookDescription.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bookDescription.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }

        
    
}
