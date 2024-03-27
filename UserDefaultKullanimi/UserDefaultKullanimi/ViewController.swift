//
//  ViewController.swift
//  UserDefaultKullanimi
//
//  Created by Yasemin TOK on 27.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelSayac: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //Tanımlama
        let ud = UserDefaults.standard
        
        //Kayıt
        ud.set("Ahu", forKey: "ad")
        ud.set("25", forKey: "yas")
        ud.set("1.65", forKey: "boy")
        ud.set(true, forKey: "bekar")
        
        let liste = ["beste", "gülfem"]
        ud.set(liste, forKey: "liste")
        
        let sehirler = ["16": "Bursa", "34": "İstanbul"]
        ud.set(sehirler, forKey: "sehirler")
        
        //Silme
        //ud.removeObject(forKey: "ad")
        
        //Okuma
        let gelenAd = ud.string(forKey: "ad") ?? "isim yok" //eğer gelen veri olmazsa isim yok aktarılacak
        let gelenYas = ud.integer(forKey: "yas") //hata olursa kendisi 0 oluyor
        let gelenBoy = ud.double(forKey: "boy") //varsayılan değeri 0.0
        let gelenBekar = ud.bool(forKey: "bekar") //varsayılan değeri false
        print("Gelen Ad    : \(gelenAd)")
        print("Gelen Yaş   : \(gelenYas)")
        print("Gelen Boy   : \(gelenBoy)")
        print("Gelen Bekar : \(gelenBekar)")
        
        let gelenListe = ud.array(forKey: "liste") ?? [String]()
        
        for a in gelenListe {
            print("Gelen Liste : \(a)")
        }
        
        let gelenSehirler = ud.dictionary(forKey: "sehirler") ?? [String: String]()
        
        for (anahtar,deger) in gelenSehirler {
            print("Gelen Şehir : \(anahtar) -> \(deger)")
        }
        
        //Sayac Uygulaması
        var sayac = ud.integer(forKey: "sayac") // varsayılan 0 //okudu
        
        sayac = sayac + 1 //arttırdı
        
        ud.set(sayac, forKey: "sayac") //kaydetti
        
        labelSayac.text = "Açılış Sayısı: \(sayac)" //yazdırdı
    }
}
