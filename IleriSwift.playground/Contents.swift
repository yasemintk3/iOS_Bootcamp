import UIKit

// If

func kisiTanima1(ad:String) {
    if ad == "Ahmet" { // If ilk parantezde true durumu için çalışır, guard ilk parantezde false durumu için çalışır.
        print("Merhaba Ahmet")
    } else {
        print("Tanınmayan Kişi")
    }
}

kisiTanima1(ad: "Ahmet")

// Guard

func kisiTanima2(ad:String) {
    guard ad == "Ahmet" else { // sadece sorun olduğunda çalışır.
        print("Tanınmayan Kişi")
        return // fonsiyonun çalışmasını durdurur.
    }
    print("Merhaba Ahmet") // eğer false değilse, else dışına true durumu yazılır.
}

kisiTanima2(ad: "Ahmet")

// Hata Ayıklama
// 1.Compile Error : Editör Hataları

/*let x = 10 // let olduğu bile bile atama yapmak gibi
x = 40*/   // Sistemin verdiği hatalar

// 2.Runtime Error : Exception : Çalışma sırasında oluşan hatalar

//let sonuc = 10 / 0 //yazarken sorun yok ama çalışınca sorun var

enum Hatalar : Error {
    case sifiraBölunmeHatasi
}

func bolme(sayi1:Int, sayi2:Int) throws -> Int { // throws, bu kodda hata olabilir try catch kullan demek
    if sayi2 == 0 { // 2.adım 0 olduğu anda throw kısmı çalıştı ve hata tespit edildi
        throw Hatalar.sifiraBölunmeHatasi
    }
    return sayi1 / sayi2
}

do{
    let sonuc = try bolme(sayi1: 10, sayi2: 0) // 1.adım try içi kontrol edildi
    print(sonuc)
} catch Hatalar.sifiraBölunmeHatasi { // 3.adım catchte hatayı buldu ve içeriği çalıştırdı.
    print("Sayı sıfıra bölünemez")
}

let sonuc1 = try? bolme(sayi1: 10, sayi2: 5) // Eğer hata olursa sonuç nil olur.

if let temp = sonuc1 {
    print(temp)
} else {
    print("Sayı sıfıra bölünemez")
}
