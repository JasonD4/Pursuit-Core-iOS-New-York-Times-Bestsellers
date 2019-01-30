//
//  SettingViewController.swift
//  NYTBestsellers
//
//  Created by Jason on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    var setting = SettingView()
    var settingCatagory = [Catagory](){
        didSet{
            DispatchQueue.main.async{
            self.setting.settingPicker.reloadAllComponents()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(setting)
        updateSettingPicker()
        setting.settingPicker.dataSource = self
        setting.settingPicker.delegate = self
    }
    
    func updateSettingPicker(){
        CatagoryAPI.typeData { (error, catagory) in
            if let error = error{
                print(error)
            }
            if let catagory = catagory{
                self.settingCatagory = catagory
                
            }
        }
    }


}

extension SettingViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingCatagory.count
    }
    
    
}

extension SettingViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return settingCatagory[row].display_name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(settingCatagory[row].display_name, forKey: userDefault.key)
    }
    
}
