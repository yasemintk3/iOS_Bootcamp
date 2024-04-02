//
//  KisiDetay.swift
//  KisilerUygulamasi
//
//  Created by Yasemin TOK on 20.03.2024.
//

import UIKit

class KisiDetay: UIViewController {
    
    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    var kisi:Kisiler? //burada id var aşağıda k'ye atadık
    
    var viewModel = KisiDetayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kisi {
            tfKisiAd.text = k.kisi_ad
            tfKisiTel.text = k.kisi_tel
        }
    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        
        if let ka = tfKisiAd.text , let kt = tfKisiTel.text, let k = kisi { //kisiler sınıfından oluşturduğumuz nesne ile id'ye ulaştık.
            viewModel.guncelle(kisi_id: Int(k.kisi_id!)!, kisi_ad: ka, kisi_tel: kt) //sınıftaki haliyle geldi.
        }
    }
}
