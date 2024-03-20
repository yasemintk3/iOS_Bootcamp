//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by Yasemin TOK on 20.03.2024.
//

import UIKit

class Anasayfa: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func buttonDetay(_ sender: Any) {
        
        let kisi = Kisiler(kisi_id: 1, kisi_ad: "Ahu", kisi_tel: "555555")
        performSegue(withIdentifier: "toDetay", sender: kisi)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let kisi = sender as? Kisiler {
                let gidilecekVC = segue.destination as! KisiDetay
                gidilecekVC.kisi = kisi // ilk kisi detay sayfasındaki oluşturulmuş olan ikincisi ise yukarıda
            }
        }
    }
}

