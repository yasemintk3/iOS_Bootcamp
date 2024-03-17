//
//  OyunEkraniVC.swift
//  CalismaYapisi
//
//  Created by Yasemin TOK on 16.03.2024.
//

import UIKit

class OyunEkraniVC: UIViewController {
    
    var kisi:Kisiler?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kisi {
            print("------- Oyun Ekran -------")
            print("Kişi ad    : \(k.ad!)")
            print("Kişi yaş   : \(k.yas!)")
            print("Kişi boy   : \(k.boy!)")
            print("Kişi bekar : \(k.bekar!)")
        }
    }
    
    @IBAction func buttonGeri(_ sender: Any) {
        navigationController?.popViewController(animated: true) //bir öneceki sayfaya dönüş
        //navigationController?.popToRootViewController(animated: true) //anasayfaya dönüş
    }
    
    @IBAction func buttonBitir(_ sender: Any) {
        performSegue(withIdentifier: "sonucEkraninaGecis", sender: nil)
    }
    
}
