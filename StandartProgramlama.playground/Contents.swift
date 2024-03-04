import UIKit

//Karşılaştırma Operatörleri

var a = 40
var b = 50

var x = 90
var y = 80

print("a == b : \(a == b)") //true false değerleri dönecek
print("a != b : \(a != b)")
print("a > b  : \(a > b)")
print("a < b  : \(a < b)")
print("a >= b : \(a >= b)")
print("a <= b : \(a <= b)") //biri bile doğruysa true

print("a > b || x > y : \(a > b || x > y)") //iki değerden biri bile doğruysa true
print("a > b && x > y : \(a > b && x > y)") //iki değerde doğruysa true

// If

var yas  = 19
var isim = "Ahmet"

if yas >= 18 {
    print("Reşitsiniz")
} else {
    print("Reşit değilsiniz")
}


if isim == "Ahmet" {
    print("Merhaba Ahmet")
} else if isim == "Mehmet"{
    print("Merhaba Mehmet")
} else {
    print("Tanınmayan Kişi")
}

var kullaniciAdi = "admin"
var sifre = 1234

if kullaniciAdi == "admin" && sifre == 1234 {
    print("Hoşgeldniz")
} else {
    print("Hatalı Giriş!")
}


var sonuc = 9

if sonuc == 9 || sonuc == 10 {
    print("Sonuç 9 veya 10'dur")
} else {
    print("Sonuç 9 veya 10 değildir")
}

// Switch

var gun = 3

switch gun {
    case 1: print("Pazartesi")
    case 2: print("Salı")
    case 3: print("Çarşamba")
    case 4: print("Perşembe")
    case 5: print("Cuma")
    case 6: print("Cumartesi")
    case 7: print("Pazar")
    default: print("Böyle bir gün yok")
}

// Döngüler
// For
// 1,2,3 değerlerinin döneceği bir döngü

for i in  1...3 { //1den başlayıp 3e kadar, i değerine sırasıyla belirlenen değerler aktarılıyor
    print("Döngü 1 : \(i)") //3 defa çılışır
}

// 10 ile 20 arasında 5er artış

for i in stride(from: 10, through: 20, by: 5) {
    print("Döngü 2 : \(i)")
}

// 20 ile 10 arasında 5er azalış

for i in stride(from: 20, through: 10, by: -5) {
    print("Döngü 3 : \(i)")
}

// While
// 1,2,3 döngüsü

var sayac = 1

while sayac < 4 {
    print("Döngü 4 : \(sayac)")
    sayac+=1 //sayac = sayac + 1
}

//Döngü Keywords

for i in 1...5 {
    if i == 3 {
        break // koşul sağlandığı zaman döngüyü tamamen durdurur
    }
    print("Döngü 5 : \(i)")
}

for i in 1...5 {
    if i == 3 {
        continue // bulunduğu adımı pas geçer bir sonraki adımdan devam eder
    }
    print("Döngü 6 : \(i)")
}
