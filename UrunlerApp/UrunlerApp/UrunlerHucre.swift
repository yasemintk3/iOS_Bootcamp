//
//  UrunlerHucre.swift
//  UrunlerApp
//
//  Created by Yasemin TOK on 21.03.2024.
//

import UIKit


protocol HucreProtocol {
    func sepeteEkleTiklandi(indexPath: IndexPath) // anasayfada index var indexe erişirsem urunlere erişirim
}

class UrunlerHucre: UITableViewCell {
    
    @IBOutlet weak var hucreArkaplan: UIView!
    @IBOutlet weak var imageViewUrun: UIImageView!
    @IBOutlet weak var labelUrunAd: UILabel!
    @IBOutlet weak var labelUrunFiyat: UILabel!
    
    var hucreProtocol:HucreProtocol?
    var indexPath:IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        
        hucreProtocol?.sepeteEkleTiklandi(indexPath: indexPath!) // anasayfada tanımladığımız hucre.indexpath değerini buraya aldık ve tekrar anasayfadaki extension funca gönderdik.
    }
}
