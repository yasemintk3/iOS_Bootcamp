//
//  FilmlerHucre.swift
//  FilmlerApp
//
//  Created by Yasemin TOK on 22.03.2024.
//

import UIKit

protocol HucreProtocol {
    func sepeteEkleTiklandi(indexPath: IndexPath)
}

class FilmlerHucre: UICollectionViewCell {
    
    @IBOutlet weak var imageViewFilm: UIImageView!
    @IBOutlet weak var labelFiyat: UILabel!
    
    var hucreProtocol:HucreProtocol?
    var indexPath:IndexPath? // Anasayfa'dan aldım
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        hucreProtocol?.sepeteEkleTiklandi(indexPath: indexPath!) // Anasayfa'da kullanılan func'a gönderdim.
    }
}
