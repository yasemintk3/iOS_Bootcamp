import UIKit

class Araba {
    var renk:String?
    var hiz:Int?
    var calisiyorMu:Bool?
    
    init() {
        print("Boş init metodu çalıştı")
    }
    
    init(renk:String, hiz:Int, calisiyorMu:Bool) {
        self.renk = renk // self = bulunduğı sınıfı temsil ediyor
        self.hiz = hiz // yani Araba() sınıfındaki hıza dışarıdan gelen hızı aktar
        self.calisiyorMu = calisiyorMu // Shadowing - Gölgeleme
        
        print("Dolu init metodu çalıştı")
    }
    
    func calistir() { // Side Effect - Yan Etki
        calisiyorMu = true
        hiz = 5
    }
    
    func durdur() {
        calisiyorMu = false
        hiz = 0
    }
    
    func hizlan(kacKm:Int) {
        hiz = hiz! + kacKm // hiz+=kacKm
    }
    
    func yavasla(kacKm:Int) {
        hiz = hiz! - kacKm
    }
    
    func bilgiAl() {
        print("----------------------------------")
        print("Renk         : \(renk!)")
        print("Hız          : \(hiz!)")
        print("Çalışıyor Mu : \(calisiyorMu!)")
    }
}

// Nesne Oluşturma

var bmw = Araba(renk: "Kırmızı", hiz: 100, calisiyorMu: true)

// Değer Atama

/*bmw.renk = "Kırmızı" // Değerler tek tek sınıfa gitti atandı ve fonksiyonda kullanıldı
bmw.hiz = 100
bmw.calisiyorMu = true*/

// Değer Okuma

/*print("----------------------------------")
print("Renk         : \(bmw.renk!)")
print("Hız          : \(bmw.hiz!)")
print("Çalışıyor Mu : \(bmw.calisiyorMu!)")*/

bmw.bilgiAl()
bmw.durdur()
bmw.bilgiAl()
bmw.hizlan(kacKm: 50)
bmw.bilgiAl()
bmw.yavasla(kacKm: 20)
bmw.bilgiAl()

var sahin = Araba()

sahin.renk = "Beyaz"
sahin.hiz = 0
sahin.calisiyorMu = false

sahin.bilgiAl()
sahin.calistir()
sahin.bilgiAl()
sahin.hizlan(kacKm: 70)
sahin.bilgiAl()
sahin.yavasla(kacKm: 30)
sahin.bilgiAl()
