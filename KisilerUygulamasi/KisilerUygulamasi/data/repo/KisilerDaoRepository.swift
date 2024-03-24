//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Yasemin TOK on 23.03.2024.
//

import Foundation
import RxSwift

class KisilerDaoRepository {
    
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    func kaydet(kisi_ad:String, kisi_tel:String) { //KisiKayitViewModel'den aldı
        print("Kişi Kaydet : \(kisi_ad) - \(kisi_tel)") //çıktı verdi.
    }
    
    func guncelle(kisi_id:Int, kisi_ad:String, kisi_tel:String) {
        print("Kişi Güncelle : \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
    }
    
    func sil(kisi_id:Int) {
        print("Kişi Sil : \(kisi_id)")
        kisileriYukle() //sil'den sonra tekrar sayfa yüklenmeli
    }
    
    func ara(aramaKelimesi:String) {
        print("Kişi Ara : \(aramaKelimesi)")
    }
    
    func kisileriYukle() {
        
        var liste = [Kisiler]()
        
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahu", kisi_tel: "555555")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Buse", kisi_tel: "666666")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "Caner", kisi_tel: "777777")
        
        liste.append(k1)
        liste.append(k2)
        liste.append(k3)
        
        kisilerListesi.onNext(liste) //fun çalıştığında tetikleyecek ve bir önceki katmana yani viewModel'a gönderecek
    }
}
