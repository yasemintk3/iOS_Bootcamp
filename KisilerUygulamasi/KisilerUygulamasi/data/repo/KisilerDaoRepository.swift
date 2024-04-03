//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Yasemin TOK on 23.03.2024.
//

import Foundation
import RxSwift
import FirebaseFirestore

class KisilerDaoRepository {
    
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    var collectionKisiler = Firestore.firestore().collection("Kisiler") //veritabanında Kisiler adlı bir tablo oluşturduk

    func kaydet(kisi_ad:String, kisi_tel:String) { //KisiKayitViewModel'den aldı
        
        let yeniKisi:[String:Any] = ["kisi_id":"", "kisi_ad":kisi_ad, "kisi_tel":kisi_tel] //ilk kayıtta id kendisi oluşturuyor
        
        collectionKisiler.document().setData(yeniKisi)
    }

    func guncelle(kisi_id:String, kisi_ad:String, kisi_tel:String) {
        
        let guncellenenKisi:[String:Any] = ["kisi_ad":kisi_ad, "kisi_tel":kisi_tel]
        
        collectionKisiler.document(kisi_id).updateData(guncellenenKisi) //kisileriYukle kısmında kisi_id'ye aktarım yaptığımız için burada kullanabiliyoruz.
    }

    func sil(kisi_id:String) {
        collectionKisiler.document(kisi_id).delete()
    }

    func ara(aramaKelimesi:String) {
        
        
        collectionKisiler.addSnapshotListener { snapshot, error in
            
            var liste = [Kisiler]()
            
            if let documents = snapshot?.documents { // var olan tüm documentlara yani tüm verilere eriştik
                for document in documents {
                    let data = document.data() // tek bir satırdaki verilere erişmek için, data = kisi_ad, kisi_id, kisi_tel bilgilerini içerir
                    let kisi_id = document.documentID // document ise firebasedeki documentID içeriyor, başta kisi_id biz oluşturamadığımız için okuma yaparken sistemin oluşturduğu id değerini kisi_id ye aktarıyoruz.
                    let kisi_ad = data["kisi_ad"] as? String ?? ""
                    let kisi_tel = data["kisi_tel"] as? String ?? ""
                    
                    if kisi_ad.lowercased().contains(aramaKelimesi.lowercased()) { // kisi_ad 'da yazılan harf veya hece var mı?
                        
                        let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                        
                        liste.append(kisi)
                    }
                }
            }
            self.kisilerListesi.onNext(liste)
        }
    }

    func kisileriYukle() {
        
        collectionKisiler.addSnapshotListener { snapshot, error in
            
            var liste = [Kisiler]()
            
            if let documents = snapshot?.documents { // var olan tüm documentlara yani tüm verilere eriştik
                for document in documents {
                    let data = document.data() // tek bir satırdaki verilere erişmek için, data = kisi_ad, kisi_id, kisi_tel bilgilerini içerir
                    let kisi_id = document.documentID // document ise firebasedeki documentID içeriyor, başta kisi_id biz oluşturamadığımız için okuma yaparken sistemin oluşturduğu id değerini kisi_id ye aktarıyoruz.
                    let kisi_ad = data["kisi_ad"] as? String ?? ""
                    let kisi_tel = data["kisi_tel"] as? String ?? ""
                    
                    let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                    
                    liste.append(kisi)
                }
            }
            self.kisilerListesi.onNext(liste)
        }
    }
}
