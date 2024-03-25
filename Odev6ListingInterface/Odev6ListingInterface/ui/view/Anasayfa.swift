//
//  ViewController.swift
//  Odev6ListingInterface
//
//  Created by Yasemin TOK on 24.03.2024.
//

import UIKit

class Anasayfa: UIViewController {
    
    @IBOutlet weak var tatliCollectionView: UICollectionView!
    @IBOutlet weak var labelBaslik: UILabel!

    var tatlilarListesi = [Tatlilar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelBaslik.font = UIFont(name: "Satisfy-Regular", size: 27)
        
        if let image = UIImage(named: "user"){
            let originalImage = image.withRenderingMode(.alwaysOriginal)
            
            let button = UIButton(type: .custom)
            button.setImage(originalImage, for: .normal)
            button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            
            let barButtonItem = UIBarButtonItem(customView: button)
    
            navigationItem.rightBarButtonItem = barButtonItem
        }
        
        view.backgroundColor = UIColor.systemGray6
        
        tatliCollectionView.delegate = self
        tatliCollectionView.dataSource = self
        
        tatliCollectionView.backgroundColor  = UIColor.systemGray6
        
        let t1 = Tatlilar(id: 1, ad: "Waffle", resim: "waffle", fiyat: 180)
        let t2 = Tatlilar(id: 2, ad: "Çilek ve Çikolata Aşkı", resim: "cilekvecikolata", fiyat: 380)
        let t3 = Tatlilar(id: 3, ad: "Elmalı Turta Dilimi", resim: "elmali", fiyat: 400)
        let t4 = Tatlilar(id: 4, ad: "Dondurma", resim: "dondurma", fiyat: 375)
        let t5 = Tatlilar(id: 5, ad: "Çikolatalı Pasta Dilimi", resim: "cikolataliKek", fiyat: 145)
        let t6 = Tatlilar(id: 6, ad: "Limon ve Lavanta Dansı", resim: "limonlu", fiyat: 550)
        tatlilarListesi.append(t1)
        tatlilarListesi.append(t2)
        tatlilarListesi.append(t3)
        tatlilarListesi.append(t4)
        tatlilarListesi.append(t5)
        tatlilarListesi.append(t6)
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        tasarim.minimumInteritemSpacing = 8
        tasarim.minimumLineSpacing = 8

        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 24) / 2

        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.4)

        tatliCollectionView.collectionViewLayout = tasarim
        

        let appearance = UITabBarAppearance()
                
        renkDegistir(itemAppearance: appearance.stackedLayoutAppearance)
        renkDegistir(itemAppearance: appearance.inlineLayoutAppearance)
        renkDegistir(itemAppearance: appearance.compactInlineLayoutAppearance)
                
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
        
    }
    
    func renkDegistir(itemAppearance:UITabBarItemAppearance) {
        //seçili durum
           
        itemAppearance.selected.iconColor = UIColor.systemRed
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemRed]
           
        //seçili olmayan durum
           
        itemAppearance.normal.iconColor = UIColor.black
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black]
           
    }
}

extension Anasayfa: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tatlilarListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let tatli = tatlilarListesi[indexPath.row]
        
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "tatlilarHucre", for: indexPath) as! TatlilarHucre
        
        hucre.imageViewTatli.image = UIImage(named: tatli.resim!)
        hucre.labelAd.text = tatli.ad
        hucre.labelFiyat.text = "\(tatli.fiyat!) ₺"
     
        hucre.layer.cornerRadius = 10.0
        
        return hucre
    }
}
