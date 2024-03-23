//
//  AnasayfaViewModel.swift
//  MVVMKullanimi
//
//  Created by Yasemin TOK on 23.03.2024.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    
    var sonuc = BehaviorSubject<String>(value: "0")
    var mrepo = MatematikRepository()
    
    init() {
        sonuc = mrepo.sonuc // Repo'dan gelen sonuc'u aktardık
    }
    
    func toplamaYap(alinanSayi1:String, alinanSayi2:String) {
        mrepo.toplamaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
    }
    
    func carpmaYap(alinanSayi1:String, alinanSayi2:String) {
        mrepo.carpmaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
    }
}
