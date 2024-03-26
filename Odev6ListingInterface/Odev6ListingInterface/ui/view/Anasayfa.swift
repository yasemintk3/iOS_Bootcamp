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
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemGray6
        
        labelBaslik.font = UIFont(name: "Satisfy-Regular", size: 25)
        
        tatliCollectionView.delegate = self
        tatliCollectionView.dataSource = self
        
        _ = viewModel.tatlilarListesi.subscribe(onNext: { liste in
            self.tatlilarListesi = liste
            self.tatliCollectionView.reloadData()
        })
        
        barButtonIcon()
        collectionViewTasarim()
        appearance()
    }
    
// MARK: Funcs
    
    func barButtonIcon() {
        
        if let image = UIImage(named: "user"){
            let originalImage = image.withRenderingMode(.alwaysOriginal)
            
            let button = UIButton(type: .custom)
            button.setImage(originalImage, for: .normal)
            button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            
            let barButtonItem = UIBarButtonItem(customView: button)
    
            navigationItem.rightBarButtonItem = barButtonItem
        }
    }
    
    func collectionViewTasarim() {
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        tasarim.minimumInteritemSpacing = 8
        tasarim.minimumLineSpacing = 8

        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 24) / 2

        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.4)

        tatliCollectionView.collectionViewLayout = tasarim
        tatliCollectionView.backgroundColor  = UIColor.systemGray6
    }
    
    func appearance() {
        
        let appearance = UITabBarAppearance()
                
        itemOzellestir(itemAppearance: appearance.stackedLayoutAppearance)
        itemOzellestir(itemAppearance: appearance.inlineLayoutAppearance)
        itemOzellestir(itemAppearance: appearance.compactInlineLayoutAppearance)
                
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
    }
    
    func itemOzellestir(itemAppearance:UITabBarItemAppearance) {
        //seçili durum
           
        itemAppearance.selected.iconColor = UIColor.systemRed
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemRed]
           
        //seçili olmayan durum
           
        itemAppearance.normal.iconColor = UIColor.black
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black]
    }
}

// MARK: Extensions

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
