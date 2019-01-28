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
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    

    lazy var picture: UIImage = {
        let image = UIImage()
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
}
