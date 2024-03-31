//
//  NotKayitViewModel.swift
//  Odev7ToDoApp
//
//  Created by Yasemin TOK on 31.03.2024.
//

import Foundation

class NotKayitViewModel {
    
    var notRepo = NotDaoRepository()
    
    func kaydet(not_name:String) {
        notRepo.kaydet(not_name: not_name)
    }
}
