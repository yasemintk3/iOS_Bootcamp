//
//  ViewController.swift
//  FilmlerApp
//
//  Created by Yasemin TOK on 22.03.2024.
//

import UIKit
import Kingfisher

class Anasayfa: UIViewController {
    
    @IBOutlet weak var filmlerCollectionView: UICollectionView!
    
    var filmlerListesi = [Filmler]()
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmlerCollectionView.delegate = self
        filmlerCollectionView.dataSource = self
        
        _ = viewModel.filmlerListesi.subscribe(onNext: { liste in
            self.filmlerListesi = liste
            DispatchQueue.main.async {
                self.filmlerCollectionView.reloadData()
            }
        })
        
        // MARK: CollectionView Design
        
        // 10 X 10 X 10 = 30 - X'ler hücre
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 30) / 2 //yatayda toplam boşluk 30, 2 görüntü olacak
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.6)
        
        filmlerCollectionView.collectionViewLayout = tasarim
    }
}

// MARK: Extensions

extension Anasayfa: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let film = filmlerListesi[indexPath.row]
        
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "filmlerHucre", for: indexPath) as! FilmlerHucre
        
        if let url = URL(string: "http://kasimadalan.pe.hu/filmler_yeni/resimler/\(film.resim!)") {
            DispatchQueue.main.async {
                hucre.imageViewFilm.kf.setImage(with: url)
            }
        }
        
        hucre.labelFiyat.text = "\(film.fiyat!) ₺"
        
        hucre.layer.borderColor = UIColor.lightGray.cgColor
        hucre.layer.borderWidth = 0.3
        hucre.layer.cornerRadius = 10.0
        
        hucre.hucreProtocol = self
        hucre.indexPath = indexPath // FilmlerHucre'ye gönderdim.
        
        return hucre
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let film = filmlerListesi[indexPath.row]
        
        performSegue(withIdentifier: "toDetay", sender: film)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetay" {
            if let film = sender as? Filmler {
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.film = film
            }
        }
    }
}

extension Anasayfa: HucreProtocol {
    
    func sepeteEkleTiklandi(indexPath: IndexPath) { // FilmlerHucre'den aldım.
        
        let film = filmlerListesi[indexPath.row] // kullandım.
        
        print("\(film.ad!) sepete eklendi.")
    }
}
