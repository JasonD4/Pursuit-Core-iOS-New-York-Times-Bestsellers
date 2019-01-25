//
//  SettingView.swift
//  NYTBestsellers
//
//  Created by Jason on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingView: UIView {
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

    lazy var settingPicker: UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    func setUpContraints(){
        addSubview(settingPicker)
        settingPicker.backgroundColor = UIColor(red: 1.00, green: 0.91, blue: 0.09, alpha:1.0)
        settingPicker.translatesAutoresizingMaskIntoConstraints = false
        settingPicker.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        settingPicker.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        settingPicker.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        settingPicker.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
