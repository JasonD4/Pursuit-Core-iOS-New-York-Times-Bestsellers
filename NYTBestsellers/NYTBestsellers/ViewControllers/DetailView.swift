//
//  DetailView.swift
//  NYTBestsellers
//
//  Created by Jason on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
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
        label.backgroundColor = .yellow
        return label
    }()
    
    lazy var bookDescription: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.init(name: "Times New Roman", size: CGFloat(20))
        textView.isEditable = false
        
        
        return textView
    }()
    lazy var saveButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "favorite"
        
        return button
    }()
    
    
    func commonInit(){
        pictureConstraint()
        labelConstraint()
        bookText()
    }
    
    
    func pictureConstraint(){
        addSubview(picture)
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        //        picture.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        picture.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        picture.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4).isActive = true
        picture.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.6).isActive = true
    }
    
    func labelConstraint(){
        addSubview(bestWeekSellerLabel)
        bestWeekSellerLabel.translatesAutoresizingMaskIntoConstraints = false
        bestWeekSellerLabel.topAnchor.constraint(equalTo: picture.bottomAnchor).isActive = true
        bestWeekSellerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        bestWeekSellerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
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
