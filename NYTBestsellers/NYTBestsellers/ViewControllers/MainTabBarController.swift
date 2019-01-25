//
//  ViewController.swift
//  NYTBestsellers
//
//  Created by Jason on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let firstVC = BestSellersViewController()
    let secondVC = FavoritesViewController()
    let thirdVC = SettingViewController()


    override func viewDidLoad() {
        super.viewDidLoad()
      let nav = BestSellerNav.init(rootViewController: firstVC)
        self.viewControllers = [nav, secondVC, thirdVC]
        firstVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .bookmarks, tag: 0)
        secondVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .favorites, tag: 1)
        thirdVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .mostViewed, tag: 2)

        
    }

}
