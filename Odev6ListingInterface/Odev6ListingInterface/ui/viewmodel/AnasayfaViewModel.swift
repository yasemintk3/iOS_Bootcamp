//
//  AnasayfaViewModel.swift
//  Odev6ListingInterface
//
//  Created by Yasemin TOK on 25.03.2024.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    
    var trepo = DaoRepository()
    var tatlilarListesi = BehaviorSubject<[Tatlilar]>(value: [Tatlilar]())
    
    init(){
        tatlilarListesi = trepo.tatlilarListesi
        tatlilariYukle()
    }
    
    func tatlilariYukle() {
        trepo.tatlilariYukle()
    }
}
