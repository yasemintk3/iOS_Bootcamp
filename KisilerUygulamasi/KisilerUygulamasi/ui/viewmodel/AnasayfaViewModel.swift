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
        veritabaniKopyala() // anasayfa çalıştığı an veritabanı kopyalanıcak
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
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "rehber", ofType: ".sqlite") //xcode da veritabanına eriştik
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! //telefon içerisinde kayıt yapılacak yeri seçtik
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite") //kopyalanacak yeri seçip rehber.sqlite diye bir veri tabanı dosyası oluşturduk
        let fileManager = FileManager.default // kopyalama yapıyoruz
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path) { //kopyalama yaparken üstte oluşturduğumuz dosya daha önce kopyalandı mı diye kontrol yapıyoruz çünkü başlarken bu kod çalışıyor, uygulama her çalıştığında kopyalama yapmasın.
            print("Veritabanı zaten var") //kopyalamaya gerek yok
        } else {
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path) // xcode içine aktardğımız dosyayı telefonda seçtiğimiz yere kopyalıyor.
            } catch {}
        }
    }
}
