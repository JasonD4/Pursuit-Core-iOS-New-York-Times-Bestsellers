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

    
    var books = [Books](){
        didSet{
            DispatchQueue.main.async{
            self.uiSetup.collectionOfBooks.reloadData()
                print(self.books.count)
            }
        }
    }
    var pickerCatagory = [Catagory](){
        didSet{
            DispatchQueue.main.async {
            self.uiSetup.pickCatagory.reloadAllComponents()
            }
        }
    }
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     updateinfo()
        
//        self.tabBarItem = UITabBarItem.init(title: <#T##String?#>, image: <#T##UIImage?#>, tag: <#T##Int#>)
        view.addSubview(uiSetup)
        
        uiSetup.pickCatagory.delegate = self
        uiSetup.pickCatagory.dataSource = self
        uiSetup.collectionOfBooks.dataSource = self
        uiSetup.collectionOfBooks.delegate = self
        uiSetup.collectionOfBooks.register(BestSellingCollectionViewCell.self, forCellWithReuseIdentifier: "BestSelling")
    }
    
   private func updateinfo(){
    
    BookAPI.typeData { (error, book) in
        if let error = error{
            print(error)
        }
        if let book = book{
            self.books = book
        }
    }
    
    CatagoryAPI.typeData { (error, catagory) in
        if let error = error{
            print(error)
        }
        if let catagory = catagory{
            self.pickerCatagory = catagory
            
        }
    }
    }
    


}


extension BestSellersViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return books.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = uiSetup.collectionOfBooks.dequeueReusableCell(withReuseIdentifier: "BestSelling", for: indexPath) as? BestSellingCollectionViewCell else { return UICollectionViewCell() }
        GoogleAPI.isbn = (books[indexPath.row].isbns.first?.isbn13) ?? "nothing"
        GoogleAPI.typeData { (error, bookImage) in
            if let error = error{
                print(error)
            }
            if let bookImage = bookImage{
                print(bookImage.count)
                ImageHelper.fetchImageFromNetwork(urlString: bookImage[0].volumeInfo.imageLinks.thumbnail! ) { (error, image) in
                    if let error = error{
                        print(error)
                    }
                    if let image = image{
                        cell.picture.image = image

                
            }
               }
        }
        }
        
    
    
        cell.bestWeekSellerLabel.text = books[indexPath.row].book_details[0].title
        cell.bookDescription.text = books[indexPath.row].book_details[0].description
        cell.bookDescription.isEditable = false
        cell.picture.image = UIImage.init(named: "myPlaceHolder")
        cell.picture.backgroundColor = .blue
        return cell
    }


}

extension BestSellersViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)

        
        let test = BestDetailViewController()
        test.isbn = books[indexPath.row].isbns[0].isbn13
        test.book = books[indexPath.row].book_details[0]

            self.navigationController?.pushViewController(test, animated: true)
        

        
    }
}




extension BestSellersViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerCatagory.count
    }
    
    
}


extension BestSellersViewController: UIPickerViewDelegate{

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerCatagory[row].display_name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        BookAPI.catagory = pickerCatagory[row].display_name.replacingOccurrences(of: " ", with: "+")
        BookAPI.typeData { (error, book) in
            if let error = error{
                print(error)
            }
            if let book = book{
                self.books = book
            }
        }
    }
    
}
