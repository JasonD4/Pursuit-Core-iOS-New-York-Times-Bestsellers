//
//  FavoriteCollectionViewCell.swift
//  NYTBestsellers
//
//  Created by Jason on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
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
        
        return label
    }()
    
    lazy var bookDescription: UITextView = {
        let textView = UITextView()
        
        
        return textView
    }()
    
    lazy var optionButtons: UIButton = {
        let button = UIButton()
        let alert = UIAlertController(title: "Options", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title: "delete", style: .destructive){(deleter) in
            
            
        })
        
        
        
    return button
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
        picture.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        picture.heightAnchor.constraint(equalToConstant: 120).isActive = true
        picture.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func labelConstraint(){
        addSubview(bestWeekSellerLabel)
        bestWeekSellerLabel.translatesAutoresizingMaskIntoConstraints = false
        bestWeekSellerLabel.topAnchor.constraint(equalTo: picture.bottomAnchor).isActive = true
        bestWeekSellerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        bestWeekSellerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
    }
    
    func bookText(){
        addSubview(bookDescription)
        bookDescription.translatesAutoresizingMaskIntoConstraints = false
        bookDescription.topAnchor.constraint(equalTo: bestWeekSellerLabel.bottomAnchor).isActive = true
        bookDescription.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bookDescription.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bookDescription.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    func option(){
        optionButtons.translatesAutoresizingMaskIntoConstraints = false
        optionButtons.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        optionButtons.rightAnchor.constraint(equalTo: rightAnchor, constant: 20)
    }

}
