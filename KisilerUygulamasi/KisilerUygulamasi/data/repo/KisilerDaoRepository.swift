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
    
    let db:FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! //kopyalanacak yeri seçtim
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite") //  veritabanı dosyası oluşturdum
        
        db = FMDatabase(path: veritabaniURL.path) // bu oluşturduğumuz db nesnesi ile telefonda oluşturduğumuz veeribanına eriştik ve artık üzerinde işlem yapabiliriz. Veritabanı verileri db nesnesine aktarılıyor.
    }
    
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
    
        db?.open()
            
        var liste = [Kisiler]()
            
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler", values: nil)  // tüm  verileri çektik
                
            while result.next() { // while döngüsü kaç satır varsa o kadar kisi nesnesi verecek
            let kisi = Kisiler(kisi_id: Int(result.string(forColumn: "kisi_id"))!,
                               kisi_ad: result.string(forColumn: "kisi_ad")!,
                               kisi_tel: result.string(forColumn: "kisi_tel")!)
                liste.append(kisi)
            }
            kisilerListesi.onNext(liste) //fun çalıştığında tetikleyecek ve bir önceki katmana yani viewModel'a gönderecek
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}
