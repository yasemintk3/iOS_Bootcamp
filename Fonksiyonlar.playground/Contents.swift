import UIKit

class Fonksiyonlar {
    
    // Geri dönüş değeri olmayan - void
    
    func selamla1() {
        let sonuc = "Merhaba Ahmet"
        print(sonuc)
    }
    
    // Geri dönüş değeri olan - return
    
    func selamla2() -> String {
        let sonuc = "Merhaba Buse"
        return sonuc
    }
    
    // Parametre
    
    func selamla3(isim:String) {
        let sonuc = "Merhaba \(isim)"
        print(sonuc)
    }
    
    func toplama(sayi1:Int, sayi2:Int) -> Int {
        let toplam = sayi1 + sayi2
        return toplam
    }
    
    // Overloading - methodun tekrar tekrar kullanımı
    
    func carpma(sayi1:Int, sayi2:Int) {
        print("Çarpma Sonuç : \(sayi1 * sayi2)")
    }
    
    func carpma(sayi1:Double, sayi2:Double) { // parametreler farklı
        print("Çarpma Sonuç : \(sayi1 * sayi2)")
    }
    
    func carpma(sayi1:Int, sayi2:Int, isim:String) {
        print("Çarpma Sonuç : \(sayi1 * sayi2) - İşlemi Yapan : \(isim)")
    }
}

let f = Fonksiyonlar()

f.selamla1() // veri iletme veya  alma işlemi yok sadece atandığı yani aralıktaki işi yapıyor

let gelenSonuc = f.selamla2() // veri iletme yapıyor ve gelen veriyi alıp istediğimiz işlemi yapabiliriz
print("Gelen Sonuç : \(gelenSonuc)")

f.selamla3(isim: "Cem") //dışarıdan parametre alınabilir

let gelenToplam = f.toplama(sayi1: 10, sayi2: 20)
print("Gelen Toplam : \(gelenToplam)")

f.carpma(sayi1: 10, sayi2: 20)
f.carpma(sayi1: 3, sayi2: 5, isim: "Derya")
