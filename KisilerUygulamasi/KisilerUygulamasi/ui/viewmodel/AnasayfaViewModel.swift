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
    var kisilerListesi = BehaviorSubject<[KisilerModel]>(value: [KisilerModel]())
    
    init() {
        kisilerListesi = krepo.kisilerListesi //repodaki listesi buradaki listeye aktardık
        kisileriYukle()  //uygulama ilk  çalıştığı  anda repoda bulunan verileri getirecek
    }
    
    func sil(kisi:KisilerModel) {
        krepo.sil(kisi: kisi)
    }
    
    func ara(aramaKelimesi:String) {
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func kisileriYukle() {
        krepo.kisileriYukle()
    }
}
