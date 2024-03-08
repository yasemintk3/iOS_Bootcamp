import UIKit

// Static Değişkenler ve Metodlar

class ASinifi {
    static var x = 10
    
    static func metod() {
        print("Metod çalıştı.")
    }
}

let a = ASinifi()

/*print(a.x)

a.metod()

print(ASinifi().x) // sanal  nesne  - virtual object - isimsiz nesne

ASinifi().metod()*/

print(ASinifi.x) // static kelimesi ile çok sık kullanılan yapıları nesne oluşturmadan kullanabiliyoruz.

ASinifi.metod()

// Enumeration

enum KonserveBoyut {
    case kucuk
    case orta
    case buyuk
}

func ucretHesaplama(boyut:KonserveBoyut, adet:Int) {
    switch boyut {
        case .kucuk: print("Fiyat : \(adet * 13) ₺")  //case KonserveBoyut.kucuk: print("Fiyat : \(adet * 13) ₺")
        case .orta:  print("Fiyat : \(adet * 24) ₺")
        case .buyuk: print("Fiyat : \(adet * 45) ₺")
    
    }
}

ucretHesaplama(boyut: .orta, adet: 100)

// Composition

class Kategoriler {
    var kategori_id:Int?
    var kategori_ad:String?
    
    init(kategori_id:Int, kategori_ad:String){
        self.kategori_id = kategori_id
        self.kategori_ad = kategori_ad
    }
}

class Yonetmenler {
    var yonetmen_id:Int?
    var yonetmen_ad:String?
    
    init(yonetmen_id:Int, yonetmen_ad:String) {
        self.yonetmen_id = yonetmen_id
        self.yonetmen_ad = yonetmen_ad
    }
}

class Filmler {
    var film_id:Int?
    var film_ad:String?
    var film_yil:Int?
    var kategori:Kategoriler? //kategoriler sınıfına erişebilirim
    var yonetmen:Yonetmenler? //yönetmenler sınıfına erişebilirim
    
    init(film_id:Int, film_ad:String, film_yil:Int, kategori:Kategoriler, yonetmen:Yonetmenler) {
        self.film_id = film_id
        self.film_ad = film_ad
        self.film_yil = film_yil
        self.kategori = kategori
        self.yonetmen = yonetmen
    }
}

let k1 = Kategoriler(kategori_id: 1, kategori_ad: "Dram")
let k2 = Kategoriler(kategori_id: 2, kategori_ad: "Komedi")

let y1 = Yonetmenler(yonetmen_id: 1, yonetmen_ad: "Qentin Tarantino")
let y2 = Yonetmenler(yonetmen_id: 2, yonetmen_ad: "Christopher Nolan")

let f1 = Filmler(film_id: 1, film_ad: "Django", film_yil: 2013, kategori: k1, yonetmen: y1)

print("Film id       : \(f1.film_id!)")
print("Film ad       : \(f1.film_ad!)")
print("Film yıl      : \(f1.film_yil!)")
print("Film kategori : \(f1.kategori!.kategori_ad!)") //Composition ile eriştik
print("Film yönetmen : \(f1.yonetmen!.yonetmen_ad!)")
