//
//  AnasayfaViewModel.swift
//  FilmlerApp
//
//  Created by Yasemin TOK on 27.03.2024.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    
    var frepo = FilmlerDaoRepository()
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())
    
    init() {
        filmlerListesi = frepo.filmlerListesi
        filmleriYukle()
    }
    
    func filmleriYukle() {
        frepo.filmleriYukle()
    }
}
