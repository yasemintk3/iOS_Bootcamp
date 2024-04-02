//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Yasemin TOK on 23.03.2024.
//

import Foundation
import RxSwift
import Alamofire

class KisilerDaoRepository {
    
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())

    func kaydet(kisi_ad:String, kisi_tel:String) { //KisiKayitViewModel'den aldı
        
        let params:Parameters = ["kisi_ad":kisi_ad, "kisi_tel":kisi_tel] //"" içerisindekiler veritabanındaki ile aynı olmalı
        
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php", method: .post, parameters: params).response { response in //bilgi istediği için method post oldu ve parametreleri ekledik
            if let data = response.data { //response.data KisilerCevap'tan gelen
                do {
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data) //adresteki veriyi alıp KisilerCevap sınıfına dönüştürüdük
    
                    print(cevap.success!)
                    print(cevap.message!)
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

    func guncelle(kisi_id:Int, kisi_ad:String, kisi_tel:String) {
        
        let params:Parameters = ["kisi_id":kisi_id, "kisi_ad":kisi_ad, "kisi_tel":kisi_tel] //"" içerisindekiler veritabanındaki ile aynı olmalı
        
        AF.request("http://kasimadalan.pe.hu/kisiler/update_kisiler.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data) //adresteki veriyi alıp KisilerCevap sınıfına dönüştürüdük
    
                    print(cevap.success!)
                    print(cevap.message!)
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

    func sil(kisi_id:Int) {
        
        let params:Parameters = ["kisi_id":kisi_id] //"" içerisindekiler veritabanındaki ile aynı olmalı
        
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data) //adresteki veriyi alıp KisilerCevap sınıfına dönüştürüdük
    
                    print(cevap.success!)
                    print(cevap.message!)
                    self.kisileriYukle() //arayüzdende silsin diye
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

    func ara(aramaKelimesi:String) {
        
        let params:Parameters = ["kisi_ad":aramaKelimesi]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php", method: .post, parameters: params).response { response in //herhangi bir bilgi istemediği için method get oldu.
            if let data = response.data { //response.data KisilerCevap'tan gelen
                do {
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data) //adresteki veriyi alıp KisilerCevap sınıfına dönüştürüdük
                    if let liste = cevap.kisiler {
                        self.kisilerListesi.onNext(liste)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

    func kisileriYukle() {
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php", method: .get).response { response in //herhangi bir bilgi istemediği için method get oldu.
            if let data = response.data { //response.data KisilerCevap'tan gelen
                do {
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data) //adresteki veriyi alıp KisilerCevap sınıfına dönüştürüdük
                    if let liste = cevap.kisiler {
                        self.kisilerListesi.onNext(liste)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
