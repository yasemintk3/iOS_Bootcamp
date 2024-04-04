//
//  FilmlerDaoRepository.swift
//  FilmlerApp
//
//  Created by Yasemin TOK on 27.03.2024.
//

import Foundation
import RxSwift
import FirebaseFirestore

class FilmlerDaoRepository {
    
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())
    var collectionFilmler = Firestore.firestore().collection("Filmler")

    func filmleriYukle() {

        collectionFilmler.getDocuments() { snapshot, error in // gerçek zamanlı okuma yapmadığımız için getdocuments kullandık.
            
            var liste = [Filmler]()
            
            if let documents = snapshot?.documents { //tüm verilere erişim
                for document in documents {
                    let data = document.data() //satıra erişim
                    
                    let id = document.documentID
                    let ad = data["ad"] as? String ?? ""
                    let resim = data["resim"] as? String ?? ""
                    let fiyat = data["fiyat"] as? Int ?? 0
                    
                    let film = Filmler(id: id, ad: ad, resim: resim, fiyat: fiyat)
                    
                    liste.append(film)
                }
            }
            self.filmlerListesi.onNext(liste)
        }
    }
}
