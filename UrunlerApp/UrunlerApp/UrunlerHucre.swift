//
//  UrunlerHucre.swift
//  UrunlerApp
//
//  Created by Yasemin TOK on 21.03.2024.
//

import UIKit

class UrunlerHucre: UITableViewCell {
    
    @IBOutlet weak var hucreArkaplan: UIView!
    @IBOutlet weak var imageViewUrun: UIImageView!
    @IBOutlet weak var labelUrunAd: UILabel!
    @IBOutlet weak var labelUrunFiyat: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        
    }
}
