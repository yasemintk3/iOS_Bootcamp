import UIKit

class OdevFonksiyonlar {
    
    //parametre olarak girilen kilometreyi mile dönüştürdükten sonra geri döndüren bir metod yazınırz. Mile = km * 0.621
    
    func kmDonustur(km:Double) -> Double {
        let mile = km * 0.621
        return mile
    }
    
    //kenarları parametre olarak girilen ve dikdörtgenin alanını hesaplayan bir metod yazınız.
    
    func dikdortgenAlani(kisaKenar:Int, uzunKenar:Int) {
        let alan = kisaKenar * uzunKenar
        print("Dikdörtgenin Alanı : \(alan)")
    }
    
    //parametre olarak girilen sayının faktoriyel değerini hesaplayıp geri döndüren metodu yazınız.
    
    func faktoriyel(sayi:Int) -> Int {
        var sonuc = 1
        for i in stride(from: 1, through: sayi, by: 1) {
            sonuc *= i
        }
        return sonuc
    }
    
    //parametre olarak girilen kelime içinde kaç adet e harfi olduğunu gösteren metodu yazınız.
    
    func eHarfi(kelime:String) {
        let karakter: Character = "e"
        var sayac = 0
        let kelimeKucukHarf = kelime.lowercased()
        for i in kelimeKucukHarf {
            if i == karakter {
                sayac += 1
            }
        }
        print("E harfi sayısı : \(sayac)")
    }
    
    //parametre olarak girilen kenar sayısına göre her bir iç açıyı hesaplayıp sonucu geri gönderen metodu yazınız.
    //iç açılar toplamı = {(kenar sayısı - 2 = 180)/ kenar sayısı}
    
    func icAciHesaplama(kenarSayisi:Double) -> Double {
        var birIcAcı = 0.0
        
        if kenarSayisi < 3 {
            print("Kenar Sayısı 3'ten küçük olamaz!")
        } else {
            birIcAcı = ((kenarSayisi - 2) * 180) / kenarSayisi
        }
        return birIcAcı
    }
    
    //parametre olarak girilen gün sayısına göre maaş hesabı yapan ve elde elien değeri döndüren method yazınız.
    
    func maasHesap(gunSayisi:Int) -> Int {
        let calismaSaati = 8
        var normalMaas = 0
        var mesailiMaas = 0
        var toplamMaas = 0
        
        if calismaSaati * gunSayisi <= 150 {
            toplamMaas = calismaSaati * 40  * gunSayisi
        } else {
            let mesaiSaati = (calismaSaati * gunSayisi) - 150
            normalMaas = 150 * 40
            mesailiMaas = mesaiSaati * 80
            toplamMaas = normalMaas + mesailiMaas
        }
        return toplamMaas
    }
    
    //parametre olarak girilen otopark süresine  göre otopark ücreti hesaplayarak geri döndüren metodu yazınız.
    
    func otoparkUcreti(saat:Int) -> Int {
        var ucret = 0
        
        if saat < 1 {
            ucret = 50
        } else {
            let fazlaSaat = (saat - 1)
            let fazlaUcret = fazlaSaat * 10
            ucret = 50 + fazlaUcret
        }
        return ucret
    }
}

let odev = OdevFonksiyonlar()

// Cevap 1

let donusumSonuc = odev.kmDonustur(km: 10)
print("Mile Olarak : \(donusumSonuc)")

// Cevap 2

odev.dikdortgenAlani(kisaKenar: 4, uzunKenar: 5)

// Cevap 3

let faktoriyelSonuc = odev.faktoriyel(sayi: 5)
print("Faktoriyel Sonucu : \(faktoriyelSonuc)")

// Cevap 4

odev.eHarfi(kelime: "Erasmus")

// Cevap 5

let icAcilar = odev.icAciHesaplama(kenarSayisi: 50)
print("Kenar Sayısına Göre Bir İç Açı : \(icAcilar)")

// Cevap 6

let maas = odev.maasHesap(gunSayisi: 20)
print("Toplam Maaşınız : \(maas)")

// Cevap 7

let otopark = odev.otoparkUcreti(saat: 5)
print("Otopark Ücreti : \(otopark)")
