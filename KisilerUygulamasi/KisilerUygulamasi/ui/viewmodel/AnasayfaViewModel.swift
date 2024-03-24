//
//  AnasayfaViewModel.swift
//  KisilerUygulamasi
//
//  Created by Yasemin TOK on 23.03.2024.
//

import Foundation
import RxSwift

class AnaSayfaViewModel {
    
    var krepo = KisilerDaoRepository()
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    init() {
        kisilerListesi = krepo.kisilerListesi //repodaki listesi buradaki listeye aktardık
        kisileriYukle()  //uygulama ilk  çalıştığı  anda repoda bulunan verileri getirecek
    }
    
    func sil(kisi_id:Int) {
        krepo.sil(kisi_id: kisi_id)
    }
    
    func ara(aramaKelimesi:String) {
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func kisileriYukle() {
        krepo.kisileriYukle()
    }
}
