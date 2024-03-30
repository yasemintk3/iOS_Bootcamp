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
    
    let db:FMDatabase? // veritabanına erişim nesnesi
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! //kopyalanacak yeri seçtim
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite") //  veritabanı dosyası oluşturdum
        
        db = FMDatabase(path: veritabaniURL.path) // bu oluşturduğumuz db nesnesi ile telefonda oluşturduğumuz veeribanına eriştik ve artık üzerinde işlem yapabiliriz. Veritabanı verileri db nesnesine aktarılıyor.
    }
    
    func kaydet(kisi_ad:String, kisi_tel:String) { //KisiKayitViewModel'den aldı
        
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO kisiler (kisi_ad, kisi_tel) VALUES (?,?)", values: [kisi_ad,kisi_tel]) // veri ekliyoruz, dışarıdan gelen [kisi_ad,kisi_tel] ? olan yerlere yerleşiyor ve veritabanına ekleme yapıldı
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func guncelle(kisi_id:Int, kisi_ad:String, kisi_tel:String) {
        
        db?.open()
        do {
            try db!.executeUpdate("UPDATE kisiler SET kisi_ad = ?, kisi_tel = ? WHERE kisi_id = ?", values: [kisi_ad,kisi_tel,kisi_id]) // güncelleme yapıyoruz, dışarıdan gelen [kisi_ad,kisi_tel] ? olan yerlere yerleşiyor ve id ye göre güncelliyor
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func sil(kisi_id:Int) {
        
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [kisi_id]) // siliyoruz, dışarıdan gelen [kisi_id] ? olan yere yerleşiyor ve id ye göre siliyor
            kisileriYukle() //sil'den sonra tekrar sayfa yüklenmeli, eğer yazılmazsa veritabanından silinir ama arayüzde kalır
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func ara(aramaKelimesi:String) {
        
        db?.open()

        var liste = [Kisiler]()
            
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad like '%\(aramaKelimesi)%'", values: nil)
                
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
    
    func kisileriYukle() {
    
        db?.open()

        var liste = [Kisiler]()
            
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler", values: nil) // tüm  verileri çektik
                
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
