//
//  KisiKayitViewModel.swift
//  KisilerUygulamasi
//
//  Created by Yasemin TOK on 23.03.2024.
//

import Foundation

class KisiKayitViewModel {
    
    var krepo = KisilerDaoRepository()
    
    func kaydet(kisi_ad:String, kisi_tel:String) { //KisiKayit'tan aldı
        krepo.kaydet(kisi_ad: kisi_ad, kisi_tel: kisi_tel) //krepo'a gönderdi
    }
}
