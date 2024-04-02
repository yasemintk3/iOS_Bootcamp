//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Yasemin TOK on 23.03.2024.
//

import Foundation
import RxSwift
import CoreData

class KisilerDaoRepository {
    
    var kisilerListesi = BehaviorSubject<[KisilerModel]>(value: [KisilerModel]())
    
    let context = appDelegate.persistentContainer.viewContext // veritabanına erişim yetkisi
    
    func kaydet(kisi_ad:String, kisi_tel:String) { //KisiKayitViewModel'den aldı
        
        let kisi = KisilerModel(context: context) //veritabanından nesne oluşturdum
        kisi.kisi_ad = kisi_ad
        kisi.kisi_tel = kisi_tel
        
        appDelegate.saveContext() //oluşturduğum nesneleri kaydet
    }
    
    func guncelle(kisi:KisilerModel, kisi_ad:String, kisi_tel:String) {
        
        kisi.kisi_ad = kisi_ad
        kisi.kisi_tel = kisi_tel
        
        appDelegate.saveContext()
    }
    
    func sil(kisi:KisilerModel) {
        
        context.delete(kisi)
        appDelegate.saveContext()
        kisileriYukle()
    }
    
    func ara(aramaKelimesi:String) {
        
        do {
            let fr = KisilerModel.fetchRequest()
            fr.predicate = NSPredicate(format: "kisi_ad CONTAINS[c] %@", aramaKelimesi)
            
            let liste = try context.fetch(fr)
            kisilerListesi.onNext(liste)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func kisileriYukle() {
    
        do {
            let liste = try context.fetch(KisilerModel.fetchRequest()) //fetchRequest tablodaki tüm verileri nesne olarak veriyor
            kisilerListesi.onNext(liste)
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
